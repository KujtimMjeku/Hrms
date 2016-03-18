package com.crms.entity;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name="USERS")
public class User implements  UserDetails, CredentialsContainer {

	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private String email;
	private String password;
	@Id
	private String username;
	
	@Transient
	private Set<GrantedAuthority> authorities;
	private boolean enabled;
	
	@ManyToMany(mappedBy="members",cascade=CascadeType.PERSIST,fetch=FetchType.EAGER)
	private Set<UserGroup> groups;
	
	

	public Set<UserGroup> getGroups() {
		return groups;
	}

	public void setGroups(Set<UserGroup> groups) {
		this.groups = groups;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setAuthorities(Set<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public void eraseCredentials() {
		this.password = null;
		
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Set<String> authority=new HashSet<>();
		for (UserGroup group : groups) {
			authority.addAll(group.getAuthorities());
		}
		Set<GrantedAuthority> authList=new HashSet<GrantedAuthority>(AuthorityUtils.createAuthorityList(authority.toArray(new String[authority.size()])));
		this.setAuthorities(authList);
		return this.authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return this.username;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", password=[protected]" +", username=" + username + ", authorities="
				+ authorities + ", enabled=" + enabled + "]";
	}

	
	

}
