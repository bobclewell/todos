require 'spec_helper'

describe "Tasks" do
    before(:each) do
      @existing_user = FactoryGirl.create(:user)
      visit root_url
      click_link 'Log In'
      fill_in 'email', :with => 'existing_user@email.net'
      click_button 'Log In'
    end

    it "creates a new task with only a title" do
      click_on "New task"
      fill_in 'task_title', :with => 'Save the world!'
      click_button "Save"
      page.should have_content 'Save the world!'
    end

    it "errors if it does not have a title" do
      click_on "New task"
      click_button "Save"
      page.should have_content "Title can't be blank"
    end

    it "creates a new task with title, description, and due date" do
      click_on "New task"
      fill_in 'task_title', :with => 'Be happy'
      fill_in 'task_description', :with => 'Drink beer, go outside, etc.'
      page.select("2012", :from => 'task_due_on_1i')
      page.select("May", :from => 'task_due_on_2i')
      page.select("13", :from => 'task_due_on_3i')
      click_button "Save"
      page.should have_content 'Be happy'
      page.should have_content '2012-05-13'
      page.should have_content 'Drink beer, go outside, etc.'
    end

    it "marks task as complete" do
      click_on "New task"
      fill_in 'task_title', :with => 'Save the world!'
      click_button "Save"
      page.should have_content 'Save the world!'
      click_on 'completed'
      page.should_not have_content 'Save the world!'
    end

end
