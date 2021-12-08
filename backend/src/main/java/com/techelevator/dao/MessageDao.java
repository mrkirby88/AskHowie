package com.techelevator.dao;

import org.apache.logging.log4j.message.Message;

import java.util.List;

public interface MessageDao {
    Message searchKeyword(String keyword);
    List<String> listKeywords();
    boolean containsKeyword(String userMessage);
    List<String> scanForKeywords(String userMessage);

}
