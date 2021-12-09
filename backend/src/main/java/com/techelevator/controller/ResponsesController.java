package com.techelevator.controller;

import com.techelevator.dao.ResponsesDao;
import com.techelevator.model.Message;
import com.techelevator.model.Responses;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping(path = "/responses/{title}", method = RequestMethod.GET)
    public Responses getResponse(@PathVariable String title) {
        return responsesDao.getResponse(title);
    }

}