package com.techelevator.dao;

import com.techelevator.model.Keywords;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface KeywordsDao {
    List<String> getAllKeywords();
}
