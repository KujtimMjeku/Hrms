package com.dms.mvc.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.dms.mvc.services.implementation.UserDetailsService;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter 
{
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	UserDetailsService userDetailsService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

		auth.userDetailsService(userDetailsService).passwordEncoder( new BCryptPasswordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {

	  http.authorizeRequests()
		.antMatchers("/filetype/**").access("hasRole('ROLE_ADMIN')")
		.and()
	    .formLogin()
	    	.loginPage("/login")
	    	.failureUrl("/login?error=true")
	    	.usernameParameter("username")
	    	.passwordParameter("password")
	    	.defaultSuccessUrl("/", true)	
	.and()
	    .logout().logoutUrl("/logout")
	    .logoutSuccessUrl("/login?logout=true")
	.and()
	    .csrf();
		
	}
}
