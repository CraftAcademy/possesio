def path_to(page_name, id = '')
  name = page_name.downcase
  case name
    when 'home' then
      root_path
    when 'login' then
      new_user_session_path
    else
      raise('path to specified is not listed in #path_to')
  end
end

Then /^I should be on the "([^"]*)" page$/ do |page|
  expect(current_path).to eq path_to(page)
end
Given /^I am on the "([^"]*)" page$/ do |page|
  visit path_to(page)
end

When(/^I click "([^"]*)"$/) do |text|
  click_link_or_button text
end

When(/^I click "([^"]*)" button$/) do |button|
  click_button button
end

When(/^I click the "([^"]*)" link$/) do |link|
  click_link link
end

When(/^I uncheck "([^"]*)"$/) do |checkbox|
  uncheck checkbox
end

When(/^I focus on input field with id "([^"]*)"$/) do |element|
  id = element.downcase.tr!(' ', '_')
  page.execute_script "$('##{id}').focus();"
end

Then /^I should( not)? (?:see|be able to select) "([^"]*)"$/ do |negative, string|
  unless negative
    expect(page).to have_text string
  else
    expect(page).to_not have_text string
  end
end
Then /^I should( not)? see link "([^"]*)"$/ do |negative, link|
  unless negative
    expect(page).to have_link link
  else
    expect(page).to_not have_link link
  end
end

And(/^I select the date "([^"]*)" in datepicker for ([^"]*)$/) do |date, element|
  id = element.downcase.tr!(' ', '_')
  page.execute_script "$('input##{id}').val('#{date}');"
end