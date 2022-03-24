<%-- 
    Document   : address_modal
    Created on : Dec 25, 2018, 2:57:34 PM
    Author     : NightPredetor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="address" class="modal fade" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-body">
            <div class="row">
                <div class="col-md-1 col-md-offset-11">
                <button style="color: white;" class="close" data-dismiss="modal">
                    <i class="fas fa-times"></i>
                </button>
              </div>
              <div class="col-md-6 col-md-offset-3">
                  <h1 style="padding-left: 30px; font-family: a_dark_wedding;">Add Address</h1>
              </div>
                <form name="address_form" method="POST" action="address_validation.jsp" novalidate>
                  <div class="col-md-6 col-md-offset-3">
                    <div class="form-group" ng-class="{ 'has-error': address_form.full_name.$touched && address_form.full_name.$invalid }">
                      <input class="form-control" type="text" class="form-control" ng-minlength="6" name="full_name" placeholder="Full Name" ng-model="full_name" required pattern="^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$"/>
                      <div style="margin-top: 0.5em;" ng-messages="address_form.full_name.$error" ng-show="address_form.full_name.$touched">
                        <p ng-message="minlength">Your name is too short.</p>
                        <p ng-message="pattern">Name can only contain letters.</p>
                        <p ng-message="required">Full name is required.</p>
                      </div>
                    </div>
                </div>
                  <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': address_form.phone.$touched && address_form.phone.$invalid }">
                      <input class="form-control" type="number" name="phone" placeholder="Mobile Number" pattern="^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$" ng-model="phone" required />
                    <div style="margin-top: 0.5em;" ng-messages="address_form.phone.$error" ng-show="address_form.phone.$touched">
                        <p ng-message="required">Mobile Number is required.</p>
                        <p ng-message="pattern">Mobile Number must be 10 digits long.</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': address_form.pincode.$touched && address_form.pincode.$invalid }">
                      <input class="form-control" type="number" name="pincode" placeholder="Pincode" ng-model="pincode" required />
                    <div style="margin-top: 0.5em;" ng-messages="address_form.pincode.$error" ng-show="address_form.pincode.$touched">
                        <p ng-message="number">Enter a valid 6 digit pincode.</p>
                        <p ng-message="required">Pincode is required.</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': address_form.address1.$touched && address_form.address1.$invalid }">
                      <input class="form-control" type="text" name="address1" placeholder="Flat / House No. / Floor / Building" ng-model="address1" required />
                    <div style="margin-top: 0.5em;" ng-messages="address_form.address1.$error" ng-show="address_form.address1.$touched">
                        <p ng-message="required">Address is required.</p>
                        <!--<p ng-message="pattern">Mobile Number must be 10 digits long.</p>-->
                    </div>
                  </div>
                </div>
                  <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': address_form.address2.$touched && address_form.address2.$invalid }">
                      <input class="form-control" type="text" name="address2" placeholder="Colony / Street / Locality" ng-model="address2" required />
                    <div style="margin-top: 0.5em;" ng-messages="address_form.address2.$error" ng-show="address_form.address2.$touched">
                        <p ng-message="required">Address is required.</p>
                        <!--<p ng-message="pattern">Mobile Number must be 10 digits long.</p>-->
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': address_form.landmark.$touched && address_form.landmark.$invalid }">
                      <input class="form-control" type="text" name="landmark" placeholder="Landmark" ng-model="landmark" required />
                    <div style="margin-top: 0.5em;" ng-messages="address_form.landmark.$error" ng-show="address_form.landmark.$touched">
                        <p ng-message="required">Landmark is required.</p>
                        <!--<p ng-message="pattern">Mobile Number must be 10 digits long.</p>-->
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group" ng-class="{ 'has-error': address_form.city.$touched && address_form.city.$invalid }">
                      <input class="form-control" type="text" name="city" placeholder="City" ng-model="city" required />
                    <div style="margin-top: 0.5em;" ng-messages="address_form.city.$error" ng-show="address_form.city.$touched">
                        <p ng-message="required">City is required.</p>
                        <!--<p ng-message="pattern">Mobile Number must be 10 digits long.</p>-->
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                      <select class="form-control" name="state" ng-model="state" required>
                        <option value="" selected disabled>Select State</option>
                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                        <option value="Assam">Assam</option>
                        <option value="Bihar">Bihar</option>
                        <option value="Chandigarh">Chandigarh</option>
                        <option value="Chhattisgarh">Chhattisgarh</option>
                        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                        <option value="Daman and Diu">Daman and Diu</option>
                        <option value="Delhi">New Delhi</option>
                        <option value="Goa">Goa</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Haryana">Haryana</option>
                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                        <option value="Jharkhand">Jharkhand</option>
                        <option value="Karnataka">Karnataka</option>
                        <option value="Kerala">Kerala</option>
                        <option value="Lakshadweep">Lakshadweep</option>
                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                        <option value="Maharashtra">Maharashtra</option>
                        <option value="Manipur">Manipur</option>
                        <option value="Meghalaya">Meghalaya</option>
                        <option value="Mizoram">Mizoram</option>
                        <option value="Nagaland">Nagaland</option>
                        <option value="Orissa">Orissa</option>
                        <option value="Pondicherry">Pondicherry</option>
                        <option value="Punjab">Punjab</option>
                        <option value="Rajasthan">Rajasthan</option>
                        <option value="Sikkim">Sikkim</option>
                        <option value="Tamil Nadu">Tamil Nadu</option>
                        <option value="Tripura">Tripura</option>
                        <option value="Uttarakhand">Uttaranchal</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="West Bengal">West Bengal</option>
                    </select>
                    <div style="margin-top: 0.5em;" ng-messages="address_form.state.$error" ng-show="address_form.state.$touched">
                        <p ng-message="required">State is required.</p>
                        <!--<p ng-message="pattern">Mobile Number must be 10 digits long.</p>-->
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-md-offset-3">
                  <div class="form-group">
                      <select class="form-control" name="address_type" ng-model="address_type" required>
                        <option value="" selected disabled>Select Address Type</option>
                        <option value="Home">Home</option>
                        <option value="Office">Office</option>
                    </select>
                    <div style="margin-top: 0.5em;" ng-messages="address_form.address_type.$error" ng-show="address_form.address_type.$touched">
                        <p ng-message="required">Address Type is required.</p>
                        <!--<p ng-message="pattern">Mobile Number must be 10 digits long.</p>-->
                    </div>
                  </div>
                </div>
                <div class="col-md-9 col-md-offset-2" style="padding-left: 2.5em !important;">
                    <%
                        if(session.getAttribute("address") != null) {
                    %>
                    <p class="fw" style="color: red; padding-left: 20px;">You need to enter an address for checkout.</p>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-6 col-md-offset-3" style="padding-left: 3.5em !important;">
                    <%
                        if(session.getAttribute("address_updated") != null) {
                    %>
                    <p class="fw" style="color: green;">Address updated Successfully</p>
                    <%
                        }
                    %>
                </div>
                <div class="col-md-3 col-md-offset-4" style="padding-left: 4em !important;">
                  <input type="submit" name="btn_address" class="btn btn-primary" ng-disabled="address_form.$invalid" />
                </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>

