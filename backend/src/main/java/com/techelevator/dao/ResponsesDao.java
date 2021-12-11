package com.techelevator.dao;

import com.techelevator.model.Responses;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ResponsesDao {

    String getResponse(String title);
    List<Responses> getAllResponses();
    List<String> getAllTitles();
    List<String> getAllKeywords();
    List<String> scanStringForKeyword(String userInput);
    boolean containsAKeyword (String userInput);

}
