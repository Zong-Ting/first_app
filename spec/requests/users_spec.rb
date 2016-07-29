require 'rails_helper'

describe "Users" do
  describe "POST /users" do
    it "registers" do
      new_user = build(:user)
	  visit new_user_path
      fill_in :user_name, with: new_user.name
	  fill_in :user_email, with: new_user.email
	  fill_in :user_password, with: new_user.password
	  fill_in :user_password_confirmation, with: new_user.password
	  click_button "註冊!"
	  page.should have_content("Welcome, #{new_user.name}!")
    end
  end
end
