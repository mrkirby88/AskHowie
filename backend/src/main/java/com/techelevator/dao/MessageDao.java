package com.techelevator.dao;

import org.apache.logging.log4j.message.Message;

import java.util.List;

public interface MessageDao {

    public Message searchKeyword(String keyword);

    public List<String> listKeywords();

    public boolean containsKeyword(String userMessage);

    public List<String> scanForKeywords(String userMessage);

}
