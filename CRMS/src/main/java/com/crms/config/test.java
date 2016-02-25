package com.crms.config;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class test {

	public static void main(String[] args) {
		BCryptPasswordEncoder pw=new BCryptPasswordEncoder();
		System.out.println(pw.encode("123456"));
		System.out.println(pw.encode("123456"));
	//	System.out.println(pw.matches("123456", "$2a$10$F3jTGzG.TvJRj9GlErLJ3eukneWjE5uUMOL8m4lBaBKpvqltebBhG"));

	}

}
