package com.techelevator.controller;

import com.techelevator.dao.KeywordsDao;
import com.techelevator.model.Keywords;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
public class KeywordsController {
    private KeywordsDao keywordsDao;

    public KeywordsController(KeywordsDao keywordsDao) {
        this.keywordsDao = keywordsDao;
    }

    @RequestMapping(path = "/api/keywords/keyword", method = RequestMethod.GET)
    public List<String> getAllKeywords() {
        return keywordsDao.getAllKeywords();
    }

    @RequestMapping(path = "/api/keywords/{keywordInput}", method = RequestMethod.GET)
    public String getKeywordResponse(@PathVariable String keywordInput) {
        return keywordsDao.keywordResponse(keywordInput);
    }
}
//    @RequestMapping(path = "/api/")
