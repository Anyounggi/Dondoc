package com.dondoc.backend.moim.entity;

import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="WithdrawRequest")
@Getter @Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class WithdrawRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="moimMemberId")
    private MoimMember moimMember;

    @Column(name="title", nullable = false, columnDefinition = "LONGTEXT")
    private String title;

    @OneToOne
    @JoinColumn(name = "categoryId")
    private Category category;

    @Column(name="amount", nullable = false)
    private int amount;

    @Column(name="content", nullable = false, columnDefinition = "LONGTEXT")
    private String content;

    @Column(name="status" , nullable = false)
    private int status;

    @OneToMany(mappedBy = "withdrawRequest")
    private List<AllowRequest> allowRequest;
}
