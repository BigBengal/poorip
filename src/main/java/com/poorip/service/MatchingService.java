package com.poorip.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poorip.repository.MatchingDao;

@Service
public class MatchingService {

	@Autowired
	private MatchingDao matchingDao;
	
}
