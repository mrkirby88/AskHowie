package com.techelevator.controller;

import com.techelevator.dao.ResponsesDao;
import com.techelevator.model.Responses;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ResponsesController {
    private ResponsesDao responsesDao;

    public ResponsesController(ResponsesDao responsesDao){
        this.responsesDao = responsesDao;
    }

    @RequestMapping(value = "responses/{title}", method = RequestMethod.GET)
    public Responses getResponse(@PathVariable String title){
        return responsesDao.getResponse(title);
    }
}
