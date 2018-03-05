Then(/^Left Unit picker value should be "([^"]*)"$/) do |arg|
  actual_picker_text = find_elements(id: "select_unit_spinner")[0].text
  if actual_picker_text != arg
    fail("Expected left unit picker is not #{arg} current value was #{actual_picker_text}")
  end
end

And(/^Right unit picker value should be "([^"]*)"$/) do |arg|
  actual_picker_text = find_elements(id: "select_unit_spinner")[1].text
  if actual_picker_text != arg
    fail("Expected right unit picker is not #{arg} current value was #{actual_picker_text}")
  end
end

Then(/^Show All button should be (enabled|disabled|undefined)$/) do |state|
  button_state = find_element(id "btn_show_all").enabled?
  if state == "enabled"
      fail("expected enabled")if button_state != true
  elsif state == "disabled"
      fail("expected disabled")if button_state != false
    end
end

When(/^I press on Clear button$/) do
  puts ("Testing")
end

When(/^I type "([^"]*)" on application dashboard$/) do |target|
  if target.length > 0
  digits = target.split("")
    digits.each do |digit|
    find_element(id: "keypad").find_element(xpath:"//android.widget.Button[@text='#{digit}']").click
    end
  else
    find_element(id: "keypad").find_element(xpath:"//android.widget.Button[@text='#{target}']").click
  end
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  current_value = find_element(id: "converter_section").find_element(id: "target_value").text
  if current_value != result
    fail("the value #{current_value} is different than #{result }, the value expected was #{result}")
  end
end


Then(/^I press on Add favorite icon$/) do
  find_element(id: "action_add_favorites").click
end

Then(/^I press on Favorite conversions$/) do
  text("Favorite conversions").click
end

And(/^I verify "([^"]*)" added to Favorite conversion List$/) do |unit_type|
  value = find_element(id: "favorites_item_hint").text
  if value != unit_type
    fail("the value #{value} is different than #{unit_type}")
  end
end

Then(/^I press on Search Icon$/) do
  find_element(id: "action_search").click
end

When(/^I type "([^"]*)" on search field$/) do |arg|
  find_element(id: "search_src_text").send_keys(arg)
end

And(/^I press return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:0.99,y:0.99, count: 1).perform
end

Then(/^I see "([^"]*)" as a current conversion$/) do |arg|
  #action_bar
  find_element(id: "action_bar").find_element(xpath:"//android.widget.TextView[@text='#{arg}']")
  text(arg)
end

Then(/^I select "([^"]*)" from left unit picker$/) do |arg|
  find_element(id: "layout_unit_spinners").find_elements(id: "select_unit_spinner_arrow")[0].click
  find_in_list(arg)
end

Then(/^I press on "([^"]*)"$/) do |arg|
  find_element(id: "category_list_drawer").find_element(xpath: "//android.widget.TextView[@text='#{arg}']").click
  #find_element(xpath: "//android.widget.TextView[@text='#{arg}']").click
end

Then(/^I select "([^"]*)" from right unit picker$/) do |arg|
  find_elements(id: "select_unit_spinner_arrow")[1].click
  find_in_list(arg)
end

When(/^I press switch units button$/) do
  find_element(id: "img_switch").click
end

Then(/^I should see "([^"]*)"$/) do |arg|
  text("No history right now")
end

And(/^I verify that (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text
  if actual_text != text
    fail("Expected text is #{text}, actual text is #{actual_text}")
  end
end


When(/^I press delete from history at (\d+)(?:st|nd|rd|th)? row$/) do |index|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end

Then(/^I should see text "([^"]*)"$/) do |value|
  text(value)
end

