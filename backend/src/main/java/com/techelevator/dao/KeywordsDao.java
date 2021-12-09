package com.techelevator.dao;


import com.techelevator.model.Keywords;

import java.util.List;

public interface KeywordsDao {

    String getKeyword(String keyword);
    List<String> getAllKeywords();
}
