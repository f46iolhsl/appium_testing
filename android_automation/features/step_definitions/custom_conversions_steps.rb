Then(/^I press on Create your first conversion button$/) do
  find_element(id: "btn_new_custom_conversion").click
end

And(/^I type "([^"]*)" as custom conversion name$/) do |conversion_name|
  find_element(id: "edit_custom_conversion_category_name").send_keys(conversion_name)
end

When(/^I press on New unit button$/) do
  find_element(id: "btn_new_custom_unit").click
end

Then(/^I type "([^"]*)" as unit name$/) do |unit_name|
  find_element(id: "edit_custom_conversion_unit_dtls_name").send_keys(unit_name)
end

Then(/^I type "([^"]*)" as symbol$/) do |symbol|
  find_element(id: "edit_custom_conversion_unit_dtls_symbol").send_keys(symbol)
end

Then(/^I type "([^"]*)" as value$/) do |unit_value|
  find_element(id: "edit_custom_conversion_unit_dtls_value").send_keys(unit_value)
end

Then(/^I press submit checkMark on Customer Conversions screen$/) do
  find_element(id: "action_confirm_custom_unit").click
end

When(/^I pree on ok conversion button$/) do
  find_element(id: "btn_custom_conversion_details_ok").click
end

Then(/^I verify "([^"]*)" added to Custom conversion List$/) do |arg|
  text(arg)
end

