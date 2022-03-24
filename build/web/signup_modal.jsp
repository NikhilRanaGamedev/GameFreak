<%-- 
    Document   : signup_modal
    Created on : Dec 16, 2018, 3:38:24 PM
    Author     : NightPredetor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="signup" class="modal fade" role="dialog">
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
                  <h1>Signup</h1>
                </div>
              </div>
              <div class="col-md-6 col-md-offset-3">
                <p class="col-md-offset-1" style="align-text:center;">
                  Join Us In The Sleepless Nights
                </p>
              </div>
                <form name="signup_form" method="POST" action="signup_validation.jsp" novalidate>
                  <div class="col-md-6 col-md-offset-3">
                    <div class="form-group" ng-class="{ 'has-error': signup_form.first_name.$touched && signup_form.first_name.$invalid }">
                      <input class="form-control" type="text" class="form-control" ng-minlength="3" name="first_name" placeholder="First Name" ng-model="first_name" required pattern="[A-Za-z]{3,30}"/>
                      <div style="margin-top: 0.5em;" ng-messages="signup_form.first_name.$error" ng-show="signup_form.first_name.$touched">
                        <p ng-message="minlength">Your name is too short.</p>
                        <p ng-message="pattern">Name can only contain letters.</p>
                        <p ng-message="required">First name is required.</p>
                      </div>
                      <%
                          if(session.getAttribute("first_name_error") != null) {
                      %>
                      <p style="padding-top: 5px;">Invalid Name</p>
                      <%
                          }
                      %>
                    </div>
                </div>
                  <div class="col-md-6 col-md-offset-3">
                    <div class="form-group" ng-class="{ 'has-error': signup_form.last_name.$touched && signup_form.last_name.$invalid }">
                        <input class="form-control" type="text" name="last_name" placeholder="Last Name" minlength="3" name="last_name" placeholder="last Name" ng-model="last_name" required pattern="[A-Za-z]{3,30}" required />
                        <div style="margin-top: 0.5em;" ng-messages="signup_form.last_name.$error" ng-show="signup_form.last_name.$touched">
                        <p ng-message="minlength">Your name is too short.</p>
                        <p ng-message="pattern">Name can only contain letters.</p>
                        <p ng-message="required">Last name is required.</p>
                        </div>
                        <%
                          if(session.getAttribute("last_name_error") != null) {
                        %>
                        <p style="padding-top: 5px;">Invalid Name</p>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': signup_form.email.$touched && signup_form.email.$invalid }">
                      <input class="form-control" type="email" name="email" placeholder="Email" ng-model="email" required />
                    <div style="margin-top: 0.5em;" ng-messages="signup_form.email.$error" ng-show="signup_form.email.$touched">
                        <p ng-message="email">Enter a valid email address.</p>
                        <p ng-message="required">Email is required.</p>
                    </div>
                        <%
                            if(session.getAttribute("email_error") != null) {
                        %>
                        <p style="padding-top: 5px;">Invalid Email</p>
                        <%
                            }
                        %>
                        <%
                            if(session.getAttribute("same_email") != null) {
                        %>
                        <p style="padding-top: 5px;">Email already used.</p>
                        <%
                            }
                        %>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': signup_form.phone.$touched && signup_form.phone.$invalid }">
                      <input class="form-control" type="text" name="phone" placeholder="Mobile Number" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$" ng-model="phone" required />
                    <div style="margin-top: 0.5em;" ng-messages="signup_form.phone.$error" ng-show="signup_form.phone.$touched">
                        <p ng-message="required">Mobile Number is required.</p>
                        <p ng-message="pattern">Mobile Number must be 10 digits long.</p>
                    </div>
                      <%
                          if(session.getAttribute("phone_error") != null) {
                      %>
                      <p style="padding-top: 5px;">Invalid Mobile Number</p>
                      <%
                          }
                      %>
                  </div>
                </div>
                  <div class="col-md-6 col-md-offset-3">
                    <div class="form-group" ng-class="{ 'has-error': signup_form.password.$touched && signup_form.password.$invalid }">
                        <input class="form-control" type="password" ng-minlength="8" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" ng-model="password" required />
                        <div style="margin-top: 0.5em;" ng-messages="signup_form.password.$error" ng-show="signup_form.password.$touched">
                            <p ng-message="required">Password is required.</p>
                            <p ng-message="pattern">Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters.</p>
                        </div>
                      <%
                          if(session.getAttribute("password_error") != null) {
                      %>
                      <p style="padding-top: 5px;">Invalid Password</p>
                      <%
                          }
                      %>
                    </div>
                </div>
                <div class="col-md-12">
                    <p style="text-align: center !important;"><a href="#" data-toggle="modal" data-target="#login">Already have an account?</a></p>
                </div>
                <div class="col-md-3 col-md-offset-4" style="padding-left: 4em !important;">
                  <input type="submit" name="btn_signup" class="btn btn-primary" ng-disabled="signup_form.$invalid" />
                </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
