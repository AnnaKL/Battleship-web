Given(/^I am on the homepage$/) do
 visit '/'
end

When(/^I follow "([^"]*)"$/) do |new_game|
  click_link(new_game)
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
fill_in('name', :with => 'my name')
end

When(/^I press "([^"]*)"$/) do |arg1|
  click_button('Submit')
end

Given(/^I am on the New Game page$/) do
  visit '/New_Game'
end

# When(/^I enter an empty box$/) do
#   When(/^I don't fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
#   fill_in('name', :with => '')
#   end
# end

When(/^I don't fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
 fill_in('name', :with =>  'name'.empty?)
end