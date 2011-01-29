When /^I display the post$/ do
  visit "/post/#{@post.id}"
end

Given /^I have a user named "([^"]*)"$/ do |name|
  @user = User.create :name => name
end

When /^I fill if "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  
end

When /^I click "([^"]*)"$/ do |arg1|
  
end    