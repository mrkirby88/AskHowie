package com.techelevator.controller;

import com.techelevator.dao.KeywordsDao;
import com.techelevator.model.Keywords;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class KeywordsController {
    private KeywordsDao keywordsDao;

    public KeywordsController(KeywordsDao keywordsDao){
        this.keywordsDao = keywordsDao;
    }

    @RequestMapping(path = "/api/keywords/keyword",  method = RequestMethod.GET)
    public List<String> getAllKeywords() {
        return keywordsDao.getAllKeywords();
    }
}

//    @RequestMapping(path = "/api/")
