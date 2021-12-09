package com.techelevator.dao;

import com.techelevator.model.Keywords;
import com.techelevator.model.Responses;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.util.ArrayList;
import java.util.List;

public class JdbcKeywordsDao implements KeywordsDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcKeywordsDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public String getKeyword(String keyword) {
        return null;
    }

    @Override
    public List<String> getAllKeywords() {
        String sql = "select keyword FROM keywords;";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        List<String> keywords = new ArrayList<>();
        while (rowSet.next()) {
            keywords.add(rowSet.getString("keyword"));
        }
        return keywords;
    }

//    private Keywords mapRowToTransfers(SqlRowSet rowSet) {
//        Keywords keywords = new Keywords();
//        keywords.setKeywordID(rowSet.getLong("keywordID"));
//        keywords.setKeyword(rowSet.getString("keyword"));
//        return keywords;
//    }
}
