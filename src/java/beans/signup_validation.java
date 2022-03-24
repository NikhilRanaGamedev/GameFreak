/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

/**
 *
 * @author NightPredetor
 */
public class signup_validation {
    private String first_name = null;
    private String last_name = null;
    private String email = null;
    private String phone = null;
    private String password = null;

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean validateFirstName(String first_name) {
        if(first_name != null && !first_name.equals("") && first_name.matches("[A-Za-z]{3,30}")) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean validateLastName(String last_name) {
        if(last_name != null && !last_name.equals("") && last_name.matches("[A-Za-z]{3,30}")) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean validateEmail(String password) {
        if(email != null && !email.equals("") && email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean validatePhone(String phone) {
        if(phone != null && !phone.equals("") && phone.matches("^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[789]\\d{9}$")) {
            return true;
        } else {
            return false;
        }
    }
    
    public boolean validatePassword(String password) {
        if(password != null && !password.equals("") && password.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}")) {
            return true;
        } else {
            return false;
        }
    }
}
