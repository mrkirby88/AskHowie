package com.techelevator.dao;

import org.apache.logging.log4j.message.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMessageDao implements MessageDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JdbcMessageDao(DataSource datasource) {
        this.jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public Message searchKeyword(String keyword) {
        String sqlSearch = "SELECT answer FROM responses JOIN keywords ON responses.id = keywords.keywordid WHERE keywords.words = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearch, keyword);

        Message response = new Message();

        if (results.next()) {
            response.setResponse(results.getString("answer"));
        } else response.setResponse("Keyword not recognized.");

        return response;

    }

    @Override
    public List<String> listKeywords() {
        String sqlSelectAll = "SELECT words FROM keywords";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAll);

        List<String> allKeywords = new ArrayList<String>();

        while (results.next()) {
            allKeywords.add(results.getString("words"));
        }

        return allKeywords;

    }

    @Override
    public boolean containsKeyword(String userMessage) {
        boolean keywordCheck = false;
        String noSpaces = userMessage.replaceAll("\\s","");
        String allDown = noSpaces.toLowerCase();

        List<String> keywords = listKeywords();

        for(String word : keywords) {
            if (allDown.contains(word)) {
                keywordCheck = true;
            }
        }

        return keywordCheck;
    }

    @Override
    public List<String> scanForKeywords(String userMessage) {
        List<String> matchingKeywords = new ArrayList<String>();
        String noSpaces = userMessage.replaceAll("\\s","");
        String allDown = noSpaces.toLowerCase();

        List<String> keywords = listKeywords();

        for(String word : keywords) {
            if (allDown.contains(word)) {
                matchingKeywords.add(word);
            }
        }

        return matchingKeywords;
    }

}
