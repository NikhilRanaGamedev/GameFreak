<%-- 
    Document   : login_modal
    Created on : Dec 16, 2018, 3:39:46 PM
    Author     : NightPredetor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="login" class="modal fade" role="dialog">
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
                  <h1>Login</h1>
                </div>
              </div>
              <div class="col-md-4 col-md-offset-4">
                <p>
                  Log into your account
                </p>
              </div>
                <form name="login_form" method="POST" action="login_validation.jsp" novalidate>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                    <input class="form-control" type="email" name="login_email" placeholder="Email" ng-model="login_email" required />
                    <div style="margin-top: 0.5em;" ng-messages="login_form.login_email.$error" ng-show="login_form.login_email.$touched">
                        <p ng-message="required">Email is required.</p>
                        <p ng-message="email">Enter a valid email address.</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group has-feedback">
                    <input id="login_password" class="form-control" type="password" name="login_password" placeholder="Password" ng-model="login_password" required/>
                    <i class="fas fa-eye-slash form-control-feedback"></i>
                    <div style="margin-top: 0.5em;" ng-messages="login_form.login_password.$error" ng-show="login_form.login_password.$touched">
                        <p ng-message="required">Password is required.</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3" style="padding-left: 3em !important;">
                    <%
                    if(session.getAttribute("wrong") == "1") {
                        out.println("<p style='color:red;font-weight:600;'>Wrong username or password</p>");
                    }
                    %>
                </div>
                <div class="col-md-6 col-md-offset-3" style="padding-left: 4em !important;">
                  <p class="col-md-offset-1"><a style="font-weight: 600;" href="#">Forgot Password?</a></p>
                </div>
                <div class="col-md-3 col-md-offset-4" style="padding-left: 4em !important;">
                  <input type="submit" name="btn_login" class="btn btn-primary" value="Log In" ng-disabled="login_form.$invalid" />
                </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>