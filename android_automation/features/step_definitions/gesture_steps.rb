When(/^I swipe from left to right$/) do
  Appium::TouchAction.new.swipe(start_x: 0.01, start_Y: 0.5, end_x: 0.8, end_y: 0.5, duration: 300).perform
end

Then(/^When I swipe from right to left$/) do
  Appium::TouchAction.new.swipe(start_x: 0.8, start_Y: 0.4, end_x: 0.1, end_y: 0.4, duration: 300).perform
end