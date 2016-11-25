When(/^user visit "([^"]*)"$/) do |arg1|
  case arg1
  when "root page"
    visit root_path
  when "inexistent page"
    visit '/inexistent_page'
  when "404 page"
    visit '/404'
  when "500 page"
    visit '/500'
  end
end

Then(/^user will see text "([^"]*)"$/) do |arg1|
  expect(page).to have_content arg1
end

Then(/^this page has element "([^"]*)"$/) do |arg1|
  element = nil
  case arg1
  when 'header'
    element = '#header'
  when 'main section'
    element = '#main'
  when 'registration form'
    element = '#registration'
  when 'how can we help you section'
    element = '#how_we_can_help'
  when 'testimonials section'
    element = '#testimonials'
  when 'footer'
    element = 'footer'
  when 'language selector'
    element = '#language_selector'
  when 'brand logo'
    element = '.navbar-brand'
  end
  expect(page).to have_css element
end

When(/^user fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^user press button "([^"]*)"$/) do |arg1|
  click_button arg1
end

When(/^user click link "([^"]*)"$/) do |arg1|
  click_link arg1
end
