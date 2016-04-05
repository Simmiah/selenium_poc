# filename: login.rb

require_relative 'base_page'

class Login < BasePage

	LOGIN_BUTTON = { css: 'a.login' }
	LOGIN_FORM = { id: 'login_form' }
	EMAIL_ADDRESS = { id: 'email' }
	PASSWORD = { id: 'passwd' }
	SIGN_IN = { id: 'SubmitLogin' }
	MY_ACCOUNT = { id: 'my-account' }
	INVALID_ALERT = { css: 'div.alert-danger > ol > li' }
	INVALID_PASSWORD_MESSAGE = 'Invalid password.'


	def initialize(driver)
		super
		visit('')
	end

	def click_login
		click(LOGIN_BUTTON)
	end

	def login_displayed?
		wait_for(10) {is_displayed?(LOGIN_FORM)}
	end

	def enter_login(email_address, password)
		type(email_address, EMAIL_ADDRESS)
		type(password, PASSWORD)
		click(SIGN_IN)
	end

	def myaccount_displayed?
		wait_for(10) {is_displayed?(MY_ACCOUNT)}
	end

	def invalid_password_displayed?
		wait_for(10) {text_includes?(INVALID_PASSWORD_MESSAGE,INVALID_ALERT)}
	end

end