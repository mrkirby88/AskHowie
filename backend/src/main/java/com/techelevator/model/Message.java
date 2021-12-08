package com.techelevator.model;

public class Message {
    private String response;
    private boolean containsKeyword;
    private boolean matchingMultipleKeywords;

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public boolean isContainsKeyword() {
        return containsKeyword;
    }

    public void setContainsKeyword(boolean containsKeyword) {
        this.containsKeyword = containsKeyword;
    }

    public boolean isMatchingMultipleKeywords() {
        return matchingMultipleKeywords;
    }

    public void setMatchingMultipleKeywords(boolean matchingMultipleKeywords) {
        this.matchingMultipleKeywords = matchingMultipleKeywords;
    }
}
