Given(/^a survey is created$/) do
  click_link 'Create new'
  fill_in 'survey_title', with: 'test survey'
  fill_in 'survey_description', with: 'test description'
  click_button 'Submit'
end

Given(/^a survey "([^"]*)" is created$/) do |arg1|
  click_link 'Create new'
  fill_in 'survey_title', with: arg1
  fill_in 'survey_description', with: 'test description'
  click_button 'Submit'
end
