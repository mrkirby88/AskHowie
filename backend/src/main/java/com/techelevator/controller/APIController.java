package com.techelevator.controller;

import com.techelevator.model.Message;
import com.techelevator.dao.MessageDao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;


@RestController
@CrossOrigin
@PreAuthorize("isAuthenticated()")
@RequestMapping("/api")
public class APIController {


//    @Autowired
//    private MessageDao messageDao;
//
//    @RequestMapping(value = "/keyword/{keyword}", method = RequestMethod.GET)
//    public Message searchByParticularKeyword(@PathVariable String keyword) {
//        return (Message) messageDao.searchKeyword(keyword);
//    }
//
//    @RequestMapping(value = "/options", method = RequestMethod.POST)
//    public List<Message> viewOptions() {
//        List<String> keywordsRaw = messageDao.listKeywords();
//        List<Message> options = new ArrayList<Message>();
//        for(String word : keywordsRaw) {
//            Message newMessage = new Message();
//            newMessage.setResponse(word);
//            options.add(newMessage);
//        }
//        return options;
//    }
//
//    @RequestMapping(value = "/call/{input}", method = RequestMethod.POST)
//    public List<Message> searchByString(@PathVariable String input) {
//
//        List<Message> responses = new ArrayList<Message>();
//
//        if(messageDao.containsKeyword(input)) {
//            List<String> matches = messageDao.scanForKeywords(input);
//            if (matches.size() > 1) {
//                for(String word : matches ) {
//                    Message addition = new Message();
//                    addition.setContainsKeyword(true);
//                    addition.setMatchingMultipleKeywords(true);
//                    addition.setResponse(word);
//                    responses.add(addition);
//                }
//            } else if (matches.size() == 1) {
//                Message dbAnswer = (Message) messageDao.searchKeyword(matches.get(0));
//                dbAnswer.setContainsKeyword(true);
//                dbAnswer.setMatchingMultipleKeywords(false);
//                responses.add(dbAnswer);
//            }
//        } else {
//            Message noAnswer = new Message();
//            noAnswer.setResponse(null);
//            noAnswer.setContainsKeyword(false);
//            noAnswer.setMatchingMultipleKeywords(false);
//            responses.add(noAnswer);
//        }
//
//        return responses;
//    }



}
