package com.techelevator.dao;

import com.techelevator.model.Responses;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ResponsesDao {

    Responses getResponse(String title);
    List<Responses> getAllResponses();

}
