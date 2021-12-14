package com.techelevator.dao;

import com.techelevator.model.Link;
import com.techelevator.model.Responses;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface ResponsesDao {

    String getResponse(String title);
    List<Responses> getAllResponses();
    List<String> getAllTitles();
    List<String> getAllKeywords();
    Responses scanStringForKeyword(String userInput);
    boolean containsAKeyword (String userInput);
    Responses getASingleResponse(String userInput);
    List<Link> getLinks(String userInput);

}
