package com.techelevator.controller;

import com.techelevator.dao.ResponsesDao;
import com.techelevator.model.Link;
import com.techelevator.model.Responses;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class ResponsesController {
    private ResponsesDao responsesDao;

    public ResponsesController(ResponsesDao responsesDao) {
        this.responsesDao = responsesDao;
    }

    @RequestMapping(path = "/responses", method = RequestMethod.GET)
    public List<Responses> getAllResponses() {
        return responsesDao.getAllResponses();
    }

    @RequestMapping(path = "/responses/{userInput}", method = RequestMethod.GET)
    public String getResponse(@PathVariable String userInput){
        return responsesDao.getResponse(userInput);
    }

    @RequestMapping(path = "/titles", method = RequestMethod.GET)
    public List<String> getAllTitles() {
        return responsesDao.getAllTitles();
    }

    @RequestMapping(path = "/keywords", method = RequestMethod.GET)
    public List<String> getAllKeywords() {
        return responsesDao.getAllKeywords();
    }

    @RequestMapping(path = "/search/{userInput}", method = RequestMethod.GET)
    public Responses searchByString(@PathVariable String userInput) {
        return responsesDao.scanStringForKeyword(userInput);
    }

    @RequestMapping(path = "answer/{userInput}", method = RequestMethod.GET)
    public Responses getASingleResponse(@PathVariable  String userInput){
        return responsesDao.getASingleResponse(userInput);
    }

}