When(/^user fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^user press button "([^"]*)"$/) do |arg1|
  click_button arg1
end

Given(/^the user "([^"]*)" with password "([^"]*)"$/) do |arg1, arg2|
  visit root_path
  email = arg1.downcase + "@example.com"
  fill_in 'user_email', with: email
  fill_in 'user_password', with: arg2
  fill_in 'user_password_confirmation', with: arg2
  click_button 'Sign up'
  user = User.find_by_email(email)
  user.confirmed_at = Time.now
  user.save
end

When(/^user "([^"]*)" signs in with password "([^"]*)"$/) do |arg1, arg2|
  email = arg1 + "@example.com"
  visit new_user_session_path
  fill_in 'user_email', with: email
  fill_in 'user_password', with: arg2
  click_button 'Log in'
end

When(/^user "([^"]*)" signs out$/) do |arg1|
  click_link 'Sign out'
end
