# filename: create_account.rb

require_relative 'base_page'

class CreateAccount < BasePage

	EMAIL_ADDRESS = { id: 'email_create' }
	CREATE_ACCOUNT = { id: 'create-account_form' }
	INVALID = { css: '#create_account_error > ol > li' }
	DUPLICATE_EMAIL = 'An account using this email address has already been registered. Please enter a valid password or request a new one.'
	INVALID_EMAIL = 'Invalid email address.'

	def initialize(driver)
		super
		visit('/index.php?controller=authentication&back=my-account')
	end

	def create_account(email)
		type(email, EMAIL_ADDRESS)
		submit(CREATE_ACCOUNT)
	end

	def duplicate_email_displayed?
		wait_for(10) {text_match(DUPLICATE_EMAIL, INVALID)}
	end

	def invalid_email_displayed?
		wait_for(10) {text_match(INVALID_EMAIL, INVALID)}
	end

end