package com.example.trader.service;

import com.example.trader.domain.p_comment.P_comment;
import com.example.trader.domain.p_comment.P_commentDto;
import com.example.trader.domain.p_comment.P_commentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@RequiredArgsConstructor
@Service
public class P_commentService {

    @Autowired
    private P_commentRepository p_commentRepository;

    public List<P_comment> comments(int p_no) {
        List<P_comment> p_commentEntityList = p_commentRepository.findByP_no(p_no);
        return p_commentEntityList;
    }

    // 생성
    public P_comment createP_comment(int p_no, P_commentDto p_commentDto) {
        P_comment p_comment = P_comment.createB_comment(p_commentDto);

        return p_commentRepository.save(p_comment);
    }
}