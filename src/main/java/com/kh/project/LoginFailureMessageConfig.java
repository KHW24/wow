package com.kh.project;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
public class LoginFailureMessageConfig {

	@Value("${error.BadCredentials}")
	private String badCredentials;

	public String getBadCredentials() {
		return badCredentials;
	}
	
	
}
