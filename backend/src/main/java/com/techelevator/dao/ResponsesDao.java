package com.techelevator.dao;

import com.techelevator.model.Responses;
import org.springframework.stereotype.Component;

@Component
public interface ResponsesDao {

    Responses getResponse(String title);

}
