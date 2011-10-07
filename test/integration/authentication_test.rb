require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  fixtures :all

   test "logging in with valid username and password" do
     User.create!(:username => "jimmy", :email => "jimmy@myemail.com", :password => "secret")
     visit login_url
     fill_in "username", :with => "jimmy"
     fill_in "password", :with => "secret"
     click_button "Login"
     assert :success
   end

   test "logging in with invalid username and password" do
     User.create!(:username => "john", :email => "john@myemail.com", :password => "secret")
     visit login_url
     fill_in "username", :with => "john"
     fill_in "password", :with => "wrong"
     click_button "Login"
     assert :success
   end

end
