package com.fittrio.fitday.config;

import lombok.Getter;

@Getter
public enum UserRole {
	ADMIN("ADMIN"),
    USER("USER");

    UserRole(String value) {
        this.value = value;
    }

    private String value;

	public String getValue() {
		return value;
	}
}
