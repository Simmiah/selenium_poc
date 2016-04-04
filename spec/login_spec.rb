# filename: login_spec.rb

require_relative 'spec_helper'
require_relative '../pages/login'

describe 'Login' do
	
	before(:each) do
		@login = Login.new(@driver)
	end

	it 'clicking signin shows login form' do
		@login.click_login
		@login.login_displayed?
	end

	it 'succeeds' do
		@login.click_login
		@login.login_displayed?
		@login.enter_login('rosalyn.goh@gmail.com', 'Test@123')
		@login.myaccount_displayed?
	end

	it 'fails with bad password' do
		@login.click_login
		@login.login_displayed?
		@login.enter_login('rosalyn.goh@gmail.com', 'bad')
		@login.invalid_password_displayed?
	end

	it 'succeeds with reusable login' do
		@login.login
		@login.myaccount_displayed?
	end

end