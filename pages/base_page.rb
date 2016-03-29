# filename: base_page.rb

require 'selenium-webdriver'

class BasePage

	EMAIL_ADDRESS = { id: 'email' }
	PASSWORD = { id: 'passwd' }
	SIGN_IN = { id: 'SubmitLogin' }

	def initialize(driver)
		@driver = driver
	end

	def login #use before each login required test
		@driver.visit('/signin')
		@driver.type('rosalyn.goh@gmail.com', EMAIL_ADDRESS)
		@driver.type('Test@123', PASSWORD)
		@driver.submit(SIGN_IN)
	end

	def visit(url_path)
		@driver.get(ENV['public'] + ENV['base_url'] + url_path)
	end

	def find(locator)
		@driver.find_element(locator)
	end

	def type(text, locator)
		find(locator).send_keys(text)
	end

	def click(locator)
		find(locator).click
	end

	def submit(locator)
		find(locator).submit
	end

	def is_displayed?(locator)
		begin
			find(locator).displayed?
		rescue Selenium::WebDriver::Error::NoSuchElementError
			false
		end
	end

	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
	end

end