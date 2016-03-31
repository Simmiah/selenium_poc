# filename: createaccount_spec.rb

require_relative 'spec_helper'
require_relative '../pages/create_account'

describe 'Create Account' do
	
	before(:each) do
		@createaccount = CreateAccount.new(@driver)
	end

	it 'fails with duplicate email' do
		@createaccount.create_account('test@test.com')
		@createaccount.duplicate_email_displayed?
	end

	it 'fails with invalid email' do
		@createaccount.create_account('test')
		@createaccount.invalid_email_displayed?
	end

end