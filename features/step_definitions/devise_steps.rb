Then(/^I should be on the edit page for user "([^"]*)"$/) do |user_name|
  user = User.find_by(name: user_name)
  expect(current_path).to eq edit_admin_admin_path(user)
end

Then(/^I should be on the view page for user "([^"]*)"$/) do |user_name|
  user = User.find_by(name: user_name)
  expect(current_path).to eq admin_admin_path(user)
end