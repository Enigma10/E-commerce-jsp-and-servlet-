package com.util;


public class SessionBean {

    private String name;

    public String getName() {
            return name;
    }

    public void setName(String name) {
        System.out.println("Setting the bean name as = " + name);
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    private String password;
}
