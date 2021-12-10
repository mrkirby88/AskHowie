package com.techelevator.dao;

import com.techelevator.model.Responses;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdcbResponsesDao implements ResponsesDao{

    private final JdbcTemplate jdbcTemplate;

    public JdcbResponsesDao(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public String getResponse(String userInput) {
        String sql = "select answer from responses join keywords on responses.id = keywordID where keyword ilike ?";
        return jdbcTemplate.queryForObject(sql, String.class, userInput);
    }

    @Override
    public List<Responses> getAllResponses() {
        String sql = "select * from responses;";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        List<Responses> responses = new ArrayList<>();
        while (rowSet.next()) {
            Responses response = mapRowToTransfers(rowSet);
            responses.add(response);
        }
        return responses;
    }

    @Override
    public List<String> getAllTitles() {
        String sql = "select title from responses;";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        List<String> responses = new ArrayList<>();
        while (rowSet.next()) {
            responses.add(rowSet.getString("title"));
        }
        return responses;
    }

    private Responses mapRowToTransfers(SqlRowSet rowSet) {
        Responses responses = new Responses();
        responses.setId(rowSet.getLong("id"));
        responses.setTitle(rowSet.getString("title"));
        responses.setAnswer(rowSet.getString("answer"));
        return responses;
    }

//    @Override
//    public List<String> listKeywords() {
//        String sqlSelectAll = "SELECT keyword FROM keywords";
//        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);
//
//        List<String> allKeywords = new ArrayList<String>();
//
//        while (results.next()) {
//            allKeywords.add(results.getString("words"));
//        }
//
//        return allKeywords;
//
//    }
//
//    @Override
//    public boolean containsKeyword(String userMessage) {
//        boolean keywordCheck = false;
//        String noSpaces = userMessage.replaceAll("\\s","");
//        String allDown = noSpaces.toLowerCase();
//
//        List<String> keywords = listKeywords();
//
//        for(String word : keywords) {
//            if (allDown.contains(word)) {
//                keywordCheck = true;
//            }
//        }
//
//        return keywordCheck;
//    }
//
//    @Override
//    public List<String> scanKeywords(String userMessage) {
//        List<String> matchingKeywords = new ArrayList<String>();
//        String noSpaces = userMessage.replaceAll("\\s","");
//        String allDown = noSpaces.toLowerCase();
//
//        List<String> keywords = listKeywords();
//
//        for(String word : keywords) {
//            if (allDown.contains(word)) {
//                matchingKeywords.add(word);
//            }
//        }
//
//        return matchingKeywords;
//    }
}
