package com.techelevator.dao;

import com.techelevator.model.Keywords;
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

    @Override
    public List<String> getAllKeywords() {
        List<String> keywords = new ArrayList<>();
        String sql = "SELECT keyword FROM keywords";
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        while (rowSet.next()){
            keywords.add(rowSet.getString("keyword"));
        }
        return keywords;
    }

    @Override
    public List<String> scanStringForKeyword(String userInput) {
        List<String> keywordMatch = new ArrayList<>();
        String getRidOfSpaces = userInput.replaceAll("//s","");
        String lowerCase = getRidOfSpaces.toLowerCase();
        List<String> keywords = getAllKeywords();

        for(String word : keywords) {
            if (lowerCase.contains(word)) {
                keywordMatch.add(word);
            }
        }
        return keywordMatch;
    }

    @Override
    public boolean containsAKeyword(String userInput) {
        boolean checkKeyword = false;
        String getRidOfSpaces = userInput.replaceAll("//s","");
        String toLowerCase = getRidOfSpaces.toLowerCase();
        List<String> keywords = getAllKeywords();

        for(String word : keywords) {
            if (toLowerCase.contains(word)) {
                checkKeyword = true;
            }
        }
        return checkKeyword;
    }

    private Responses mapRowToTransfers(SqlRowSet rowSet) {
        Responses responses = new Responses();
        responses.setId(rowSet.getLong("id"));
        responses.setTitle(rowSet.getString("title"));
        responses.setAnswer(rowSet.getString("answer"));
        return responses;
    }


}
