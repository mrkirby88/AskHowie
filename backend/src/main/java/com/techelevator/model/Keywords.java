package com.techelevator.model;

public class Keywords {

    private long keywordID;
    private String keyword;


    public Keywords(){}

    public Keywords(long keywordID, String keyword){
        this.keywordID = keywordID;
        this.keyword = keyword;
    }


    public long getKeywordID() {
        return keywordID;
    }

    public void setKeywordID(long keywordID) {
        this.keywordID = keywordID;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
