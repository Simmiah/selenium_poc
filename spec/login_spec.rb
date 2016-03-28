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
		@login.success_message_present?
	end

	it 'fails' do
		@login.click_login
		@login.login_displayed?
		@login.enter_login('rosalyn.goh@gmail.com', 'bad')
		@login.failure_message_present?
	end



end