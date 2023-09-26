package com.dondoc.backend.common.Filter;

import com.dondoc.backend.common.exception.JwtAuthFilterException;
import com.dondoc.backend.common.jwt.JwtTokenProvider;
import com.dondoc.backend.common.jwt.TokenDto;
import com.dondoc.backend.common.jwt.model.UserDetailsImpl;
import com.dondoc.backend.common.jwt.model.UserDetailsServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Component
@Slf4j
public class JwtAuthFilter extends OncePerRequestFilter {

    // 유저의 정보 로직을 담은 객체
    private UserDetailsServiceImpl userDetailsService;

    // 토큰 관련 로직을 담은 객체
    private JwtTokenProvider jwtTokenProvider;

    // 토큰 에러 처리 객체
    private JwtAuthFilterException jwtAuthFilterException;

    public JwtAuthFilter(UserDetailsServiceImpl userDetailsService, JwtTokenProvider jwtTokenProvider, JwtAuthFilterException jwtAuthFilterException) {
        this.userDetailsService = userDetailsService;
        this.jwtTokenProvider = jwtTokenProvider;
        this.jwtAuthFilterException = jwtAuthFilterException;
    }

    // accessToken 저장 헤더
    private static final String AUTH_HEADER = "Authorization";

    // 자격증명 문구
    private static final String BEARER_PREFIX = "Bearer ";

    // 제외 URL
    private static final List<String> EXCLUDE_URL = List.of(
//            "/api/user/find_user"
            "/api/user/logout"
            ,"/api/user/signup"
            ,"/api/user/signin"
            ,"/api/user/findpassword",

            "/swagger-resources/**",
            "/swagger-ui.html",
            "/swagger-ui.html#/**",
            "/swagger-ui/index.html",
            "/v2/api-docs",
            "/webjars/**"
    );

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String path = ((HttpServletRequest) request).getServletPath();

        String requestURI = request.getRequestURI();
        if (requestURI.startsWith("/swagger") || requestURI.startsWith("/v3/api-docs") ||
                requestURI.startsWith("/swagger-resources/") || requestURI.startsWith("/webjars/")) {
            filterChain.doFilter(request, response);
            return;
        }

        if(EXCLUDE_URL.contains(path)){
            log.info("필터링 하지 않습니다.");
            log.info(path);
        }else{
            log.info("필터링 시작");
            log.info("URI 경로 = {}", path);

            // 헤더에서 인증정보 가져오기
            final String requestTokenHeader = request.getHeader(AUTH_HEADER);

            // 변수 선언
            String accessToken, userId, refreshToken;

            // 헤더에 토큰 존재 여부, Bearer 존재 여부
            if(requestTokenHeader != null && requestTokenHeader.startsWith(BEARER_PREFIX)){
                // Bearer을 제외한 토큰 값
                accessToken = requestTokenHeader.substring(BEARER_PREFIX.length());
                log.info("Authorization = {}", requestTokenHeader);

                // 토큰에서 정보 추출. => 실패 시 재발급
                if(!jwtTokenProvider.isTokenExpired(accessToken)) {
                    userId = jwtTokenProvider.getClaims(accessToken).getSubject();
                    log.info("userId = {}", userId);
                }else{
                    log.info("토큰을 재발급 받습니다.");

                    // 토큰 만료(재발급) => Cookie에서 RefreshToken 가져옴
                    refreshToken = getRefreshTokenFromCookie(request);
                    log.info("refreshToken = {}", refreshToken);

                    // Cookie내에 토큰이 존재여부 파악
                    if(refreshToken != null){
                        // refreshToken의 유효성 여부 파악


                        // refreshToken 만료 여부 파악
                        if(jwtTokenProvider.isRefreshTokenExpired(refreshToken)){
                            userId = jwtTokenProvider.getRefreshClaims(refreshToken).getSubject();
                            log.info("userId = {}", userId);

                            // 재발급 과정
                            UserDetailsImpl userDetails = (UserDetailsImpl) userDetailsService.loadUserByUsername(userId);

                            // TokenDto 생성
                            TokenDto tokenDto = TokenDto.builder()
                                    .phoneNumber(userDetails.getUsername())
                                    .userId(Long.parseLong(userId))
                                    .name(userDetails.getName())
                                    .build();

                            // 토큰 생성
                            String newAccessToken = jwtTokenProvider.createAccessToken(tokenDto);

                            // 헤더에 저장
                            response.setHeader(AUTH_HEADER, BEARER_PREFIX + newAccessToken);
                            log.info("재발급 완료 = {}", newAccessToken);
                        }else{
                            // refershToken 만료
                            response.setStatus(HttpServletResponse.SC_OK);
                            response.setContentType("application/json");
                            response.getWriter().write(jwtAuthFilterException.isRefreshExpired());
                            return;
                        }
                    }else{
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.setContentType("application/json");
                        response.getWriter().write(jwtAuthFilterException.noRefreshToken());
                        return;
                    }
                }

                // User 인증 정보 불러오기(유효한 accessToken)
                UserDetailsImpl userDetails = (UserDetailsImpl)userDetailsService.loadUserByUsername(userId);
                log.info("핸드폰번호 = {}", userDetails.getUsername());

                // User 정보 등록
                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                        new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
                log.info(usernamePasswordAuthenticationToken.getName());

                // Session에 user 정보 등록
            }else{
                // 인증정보가 존재하지 않음
                response.setStatus(HttpServletResponse.SC_OK);
                response.setContentType("application/json");
                response.getWriter().write(jwtAuthFilterException.noAuthentication());
                return;
            }
        }
        filterChain.doFilter(request, response);

    }

    public String getRefreshTokenFromCookie(HttpServletRequest request){
        // 쿠키 내 refreshToken 탐색
        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(cookie.getName().equals("refreshToken")){
                    return cookie.getValue();
                }
            }
        }

        // 쿠키 내 refreshToken이 없음.
        return null;
    }

}
