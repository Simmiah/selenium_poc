# filename: login.rb

require_relative 'base_page'

class Login < BasePage

	LOGIN_BUTTON = { css: 'a.login' }
	LOGIN_FORM = { id: 'login_form' }
	
	def initialize(driver)
		super
		visit('')
	end

	def login
		click(LOGIN_BUTTON)
	end

	def login_displayed?
		is_displayed?(LOGIN_FORM)
	end



end