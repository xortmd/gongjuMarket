package com.example.trader.board;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> {

//    @Query(value = "SELECT * FROM Board WHERE b_no = ? ", nativeQuery = true)
//    public Board findByB_no(int b_no);
}