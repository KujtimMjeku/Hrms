package com.crms.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private DataSource dataSource;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select username,password, enabled from users where username=?")
				.groupAuthoritiesByUsername("select g.id, g.group_name, ga.authority "
						+ "from groups g, group_members gm, group_authorities ga "
						+ "where gm.username = ? "
						+ "and g.id = ga.group_id "
						+ "and g.id = gm.group_id")
				.authoritiesByUsernameQuery("select username, role from user_roles where username=?")
				.passwordEncoder(new BCryptPasswordEncoder()).and();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

	  http.authorizeRequests()
		.antMatchers("/cartype/**").access("hasRole('ROLE_ADMIN')")
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
