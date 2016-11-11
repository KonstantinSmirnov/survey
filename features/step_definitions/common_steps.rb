Given(/^User visit "([^"]*)"$/) do |arg1|
  case arg1
  when "root page"
    visit root_path
  when "landing page"
    visit landing_path
  end
end

Then(/^User will see text "([^"]*)"$/) do |arg1|
  expect(page).to have_content arg1
end