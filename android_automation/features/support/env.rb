require 'appium_lib'

def caps
  {caps:{
      deviceName: "AnyName",
      platformName: "Android",
      app: (File.join(File.dirname(__FILE__), "PreciseUnitConversion.apk")),
      appPackage: "com.ba.universalconverter",
      appActivity: "MainConverterActivity",
      newCommandTimeOut: "3600",
  }}
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object

def find_in_list(arg)
  3.times { Appium::TouchAction.new.swipe(start_x: 0.5, start_Y: 0.2, end_x: 0.5, end_y: 0.8, duration: 600).perform }
  # get resource returns all the NEW elements in the screen
  current_screen = get_source
  previous_screen = ""
  until exists{ text(arg)} || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_Y: 0.8, end_x: 0.5, end_y: 0.2, duration: 600).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists{text(arg)}
    text(arg).click
  else
    fail("The value wasn't #{arg} found")
  end
end