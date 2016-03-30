# filename: create_account.rb

require_relative 'base_page'

class CreateAccount < BasePage

	EMAIL_ADDRESS = { id: 'email_create' }
	CREATE_ACCOUNT = { id: 'create-account_form' }

	def initialize(driver)
		super
		visit('/index.php?controller=authentication&back=my-account')
	end

	def enter_email(email)
		type(email, EMAIL_ADDRESS)
	end

	def create_account
		submit(CREATE_ACCOUNT)
	end

end