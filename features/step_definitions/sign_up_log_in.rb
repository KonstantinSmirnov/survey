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

Given(/^a logged in user$/) do
  visit root_path
  email = "test@example.com"
  password = "123123"
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password
  click_button 'Sign up'
  user = User.find_by_email(email)
  user.confirmed_at = Time.now
  user.save
  visit new_user_session_path
  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  click_button 'Log in'
end
