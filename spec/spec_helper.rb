# filename: spec_helper.rb

require 'selenium-webdriver'

RSpec.configure do |config|

 	config.before(:each) do
		case ENV['browser']
		when 'firefox'
			@driver = Selenium::WebDriver.for :firefox
		when 'chrome'
			Selenium::WebDriver::Chrome::Service.executable_path = File.join(Dir.pwd, 'vendor/chromedriver')
			@driver = Selenium::WebDriver.for :chrome
		end
		# default to using implicit wait
		@driver.manage.timeouts.implicit_wait = 10 #seconds
	end

	config.after(:each) do
		@driver.quit
	end
end