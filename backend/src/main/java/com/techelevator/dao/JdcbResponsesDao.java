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
    public Responses getResponse(String title) {
        Responses responses = null;
        String sql = "SELECT answer \n" +
                "FROM responses \n" +
                "JOIN keywords ON responses.id = keywords.keywordID " +
                "WHERE keyword LIKE ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, title);
        if(results.next()){
            responses = mapRowToTransfers(results);
        }
        return responses;
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

    public Responses mapRowToTransfers(SqlRowSet rowSet) {
        Responses responses = new Responses();
        responses.setId(rowSet.getLong("id"));
        responses.setTitle(rowSet.getString("title"));
        responses.setAnswer(rowSet.getString("answer"));
        return responses;
    }

}
