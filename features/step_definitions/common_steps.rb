When(/^user visit "([^"]*)"$/) do |arg1|
  case arg1
  when "root page"
    visit root_path
  when "landing page"
    visit landing_path
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
  end
  expect(page).to have_css element
end
