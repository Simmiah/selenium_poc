# filename: createaccount_spec.rb

require_relative 'spec_helper'
require_relative '../pages/create_account'

describe 'Create Account' do
	
	before(:each) do
		@createaccount = CreateAccount.new(@driver)
	end

	it 'fails with existing email' do
		@createaccount.enter_email('test@test.com')
		@createaccount.create_account
	end

end