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


}
