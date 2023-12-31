package com.dondoc.backend.user.dto.friend;

import com.dondoc.backend.user.entity.Friend;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.Column;
import java.time.LocalDateTime;
import java.util.List;

public class FriendRequestDto {
    @Data
    @Builder
    @ApiModel(value = "친구요청", description = "친구 요청 전송")
    public static class Request{
        @ApiModelProperty(value = "친구 ID", example = "1")
        private Long friendId; // 변수 설명

    }

    @Data
    @Builder
    public static class Response{
        private String msg;
        @JsonIgnore
        private boolean success;
    }

    @Data
    @Builder
    public static class RequestListResponse{
        private String msg;
        private List<?> list;
        @JsonIgnore
        private boolean success;
    }

    @Data
    @Builder
    public static class ReceiveInfo{
        private Long id;
        private Long friendId;
        private int imageNumber;
        private String nickName;
        private int status;
        private LocalDateTime createdAt;
    }

    @Data
    @Builder
    public static class SendInfo{
        private Long id;
        private Long userId;
        private int imageNumber;
        private String nickName;
        private int status;
        private LocalDateTime createdAt;
    }


}
