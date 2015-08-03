Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^I'm logged in as an ([^']*)/) do |role|
  user = FactoryGirl.create(role.to_sym)
  visit '/users/sign_in'
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password
  click_button 'Log in'
end

Given /^I am not logged in$/ do
  current_driver = Capybara.current_driver
  begin
    Capybara.current_driver = :rack_test
    page.driver.submit :delete, '/users/sign_out', {}
  ensure
    Capybara.current_driver = current_driver
  end
end