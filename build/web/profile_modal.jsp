<%-- 
    Document   : profile
    Created on : Dec 23, 2018, 11:32:05 PM
    Author     : NightPredetor
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    String first_name = "";
    String last_name = "";
    String email = "";
    String phone = "";
%>
<%
    String user_id = (String)session.getAttribute("user_id");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamefreak", "root", "");
    
    PreparedStatement sql = con.prepareStatement("SELECT * FROM `user_info` WHERE `user_id` = ?");

    sql.setString(1, user_id);

    ResultSet rs = sql.executeQuery();
    if(rs.next()) {
        first_name = rs.getString("first_name");
        last_name = rs.getString("last_name");
        email = rs.getString("email");
        phone = rs.getString("phone");
    }
%>
<div id="profile" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="row">
                <div class="col-md-1 col-md-offset-11">
                <button style="color: white;" class="close" data-dismiss="modal">
                    <i class="fas fa-times"></i>
                </button>
              </div>
              <div class="col-md-4 col-md-offset-4">
                <div class="col-md-offset-2">
                  <h1>Update</h1>
                </div>
              </div>
              <div class="col-md-6 col-md-offset-3">
                <p class="col-md-offset-1" style="align-text:center;">&emsp;Make changes to your character</p>
              </div>
                <form name="profile_form" method="POST" action="profile_validation.jsp" novalidate>
                  <div class="col-md-6 col-md-offset-3">
                    <div class="form-group" ng-class="{ 'has-error': profile_form.profile_first_name.$touched && profile_form.profile_first_name.$invalid }">
                        <input class="form-control" type="text" class="form-control" ng-minlength="3" name="first_name" placeholder="First Name" ng-model="profile_first_name" required pattern="[A-Za-z]{3,30}" ng-init="profile_first_name='<%= first_name %>'"/>
                      <div style="margin-top: 0.5em;" ng-messages="profile_form.profile_first_name.$error" ng-show="profile_form.profile_first_name.$touched">
                        <p ng-message="minlength">Your name is too short.</p>
                        <p ng-message="pattern">Name can only contain letters.</p>
                        <p ng-message="required">First name is required.</p>
                      </div>
                      <%
                          if(session.getAttribute("profile_first_name_error") != null) {
                      %>
                      <p style="padding-top: 5px;">Invalid Name</p>
                      <%
                          }
                      %>
                    </div>
                </div>
                  <div class="col-md-6 col-md-offset-3">
                    <div class="form-group" ng-class="{ 'has-error': profile_form.profile_last_name.$touched && profile_form.profile_last_name.$invalid }">
                        <input class="form-control" type="text" name="last_name" placeholder="Last Name" minlength="3" name="last_name" placeholder="last Name" ng-model="profile_last_name" required pattern="[A-Za-z]{3,30}" required ng-init="profile_last_name='<%= last_name %>'" />
                        <div style="margin-top: 0.5em;" ng-messages="profile_form.profile_last_name.$error" ng-show="profile_form.profile_last_name.$touched">
                        <p ng-message="minlength">Your name is too short.</p>
                        <p ng-message="pattern">Name can only contain letters.</p>
                        <p ng-message="required">Last name is required.</p>
                        </div>
                        <%
                          if(session.getAttribute("profile_last_name_error") != null) {
                        %>
                        <p style="padding-top: 5px;">Invalid Name</p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': profile_form.profile_email.$touched && profile_form.profile_email.$invalid }">
                      <input class="form-control" type="email" name="email" placeholder="Email" ng-model="profile_email" required ng-init="profile_email='<%= email %>'" />
                    <div style="margin-top: 0.5em;" ng-messages="profile_form.profile_email.$error" ng-show="profile_form.profile_email.$touched">
                        <p ng-message="email">Enter a valid email address.</p>
                        <p ng-message="required">Email is required.</p>
                    </div>
                        <%
                          if(session.getAttribute("profile_email_error") != null) {
                        %>
                        <p style="padding-top: 5px;">Invalid Email</p>
                        <%
                            }
                        %>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': profile_form.profile_phone.$touched && profile_form.profile_phone.$invalid }">
                      <input class="form-control" type="text" name="phone" placeholder="Mobile Number" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$" ng-model="profile_phone" required ng-init="profile_phone='<%= phone %>'" />
                    <div style="margin-top: 0.5em;" ng-messages="profile_form.profile_phone.$error" ng-show="profile_form.profile_phone.$touched">
                        <p ng-message="required">Mobile Number is required.</p>
                        <p ng-message="pattern">Mobile Number must be 10 digits long.</p>
                    </div>
                        <%
                          if(session.getAttribute("profile_phone_error") != null) {
                        %>
                        <p style="padding-top: 5px;">Invalid Mobile Number</p>
                        <%
                            }
                        %>
                  </div>
                </div>
                <%
                    if(session.getAttribute("profile_changed") == "1") {
                %>
                <div class="col-md-6 col-md-offset-3" style="padding-left: 3.5em !important;">
                    <p class="fw" style="color: #24C13A;">Details Update Successfully</p>
                </div>
                <%
                    }
                %>
                <div class="col-md-3 col-md-offset-4" style="padding-left: 4em !important;">
                  <input type="submit" name="btn_signup" class="btn btn-primary" ng-disabled="profile_form.$invalid" />
                </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>