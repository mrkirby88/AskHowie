package com.techelevator.model;

public class Responses {

    private long id;
    private String title;
    private String answer;

    public Responses(){}

    public Responses(long id, String title, String answer){
    this.id = id;
    this.title = title;
    this.answer = answer;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}