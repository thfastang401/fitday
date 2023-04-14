package com.fittrio.fitday.dto;

import lombok.Getter; 
import lombok.Setter;

@Getter
@Setter
public class BoardDTO { 
	int boardSeq, userSeq, viewCount, secret;
	String category, title, content, date, file;

}
