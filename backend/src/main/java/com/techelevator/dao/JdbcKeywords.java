package com.techelevator.dao;

import com.techelevator.model.Keywords;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcKeywords implements KeywordsDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcKeywords(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<String> getAllKeywords(){
        List<String> keywords = new ArrayList<>();
        String sql = "SELECT keyword FROM keywords";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while (rowSet.next()){
            keywords.add(rowSet.getString("keyword"));
        }
        return keywords;
    }

    public Keywords mapRowToTransfers(SqlRowSet rowSet) {
        Keywords keywords = new Keywords();
        keywords.setKeywordID(rowSet.getLong("keywordID"));
        keywords.setKeyword(rowSet.getString("keyword"));
        return keywords;
    }
}
