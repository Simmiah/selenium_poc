# filename: base_page.rb

require 'selenium-webdriver'

class BasePage

	LOGIN_BUTTON = { css: 'a.login' }
	EMAIL_ADDRESS = { id: 'email' }
	PASSWORD = { id: 'passwd' }
	SIGN_IN = { id: 'SubmitLogin' }

	def initialize(driver)
		@driver = driver
	end

	def login #use before each login required test
		@driver.get(ENV['public'] + ENV['base_url'] + '')
		@driver.find_element(LOGIN_BUTTON).click
		@driver.find_element(EMAIL_ADDRESS).send_keys('rosalyn.goh@gmail.com')
		@driver.find_element(PASSWORD).send_keys('Test@123')
		@driver.find_element(SIGN_IN).submit
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