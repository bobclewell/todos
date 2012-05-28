require 'spec_helper'

describe "Users" do

  it "creates a new user with an email address" do
    visit root_url
    click_link 'Sign Up'
    fill_in 'user_email', :with => 'von_hayes@email.net'
    click_button 'Sign Up'
    page.should have_content 'von_hayes@email.net'
    page.should have_content 'Log Out'
  end

  context "when a user exists" do
    before(:each) do
      @existing_user = FactoryGirl.create(:user)
    end

    it "cannot create a second user with that same address" do
      visit root_url
      click_link 'Sign Up'
      fill_in 'user_email', :with => 'existing_user@email.net'
      click_button 'Sign Up'
      page.should have_content 'Email has already been taken'
    end
  end
end
