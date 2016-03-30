# filename: login.rb

require_relative 'base_page'

class Login < BasePage

	LOGIN_BUTTON = { css: 'a.login' }
	LOGIN_FORM = { id: 'login_form' }
	EMAIL_ADDRESS = { id: 'email' }
	PASSWORD = { id: 'passwd' }
	SIGN_IN = { id: 'SubmitLogin' }
	MY_ACCOUNT = { id: 'my-account' }
	#INVALID = { xpath: "//li[contains(text(),'Invalid Password')]" } # contains not supported in selenium webdriver
	INVALID = { css: 'div.alert-danger' }

	def initialize(driver)
		super
		visit('')
	end

	def click_login
		click(LOGIN_BUTTON)
	end

	def login_displayed?
		is_displayed?(LOGIN_FORM)
	end

	def enter_login(email_address, password)
		type(email_address, EMAIL_ADDRESS)
		type(password, PASSWORD)
		click(SIGN_IN)
	end

	def success_message_present?
		is_displayed?(MY_ACCOUNT)
	end

	def failure_message_present?
		is_displayed?(INVALID)
	end

end