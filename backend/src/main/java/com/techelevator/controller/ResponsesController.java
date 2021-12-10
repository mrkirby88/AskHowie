package com.techelevator.controller;

import com.techelevator.dao.ResponsesDao;
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

    @RequestMapping(path = "/api/responses", method = RequestMethod.GET)
    public List<Responses> getAllResponses() {
        return responsesDao.getAllResponses();
    }

    @RequestMapping(path = "api/responses/{userInput}", method = RequestMethod.GET)
    public String getResponse(@PathVariable String userInput){
        return responsesDao.getResponse(userInput);
    }

    @RequestMapping(path = "/api/responses/titles", method = RequestMethod.GET)
    public List<String> getAllTitles() {
        return responsesDao.getAllTitles();
    }

//    @RequestMapping(value = "/call/{input}", method = RequestMethod.POST)
//    public List<Responses> searchByString(@PathVariable String input) {
//
//        List<Responses> responses = new ArrayList<>();
//
//        if(ResponsesDao.containsKeyword(input)) {
//            List<String> matches = ResponsesDao.scanKeywords(input);
//            if (matches.size() > 1) {
//                for(String word : matches ) {
//                    Responses addition = new Responses();
//                    addition.setTitle(true);
//                    addition.setAnswer(true);
//                    addition.setId(word);
//                    responses.add(addition);
//                }
//            } else if (matches.size() == 1) {
//                Responses dbAnswer = (Responses) ResponsesDao.getResponse(matches.get(0));
//                dbAnswer.setTitle(true);
//                dbAnswer.setAnswer(false);
//                responses.add(dbAnswer);
//            }
//        } else {
//            Responses noAnswer = new Responses();
//            noAnswer.setId(null);
//            noAnswer.setTitle(false);
//            noAnswer.setAnswer(false);
//            responses.add(noAnswer);
//        }
//
//        return responses;
//    }
}