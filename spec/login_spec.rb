# filename: login_spec.rb

require_relative 'spec_helper'
require_relative '../pages/login'

describe 'Login' do
	
	before(:each) do
		@login = Login.new(@driver)
	end

	it 'clicking signin shows login form' do
		@login.login
		@login.login_displayed?
	end

end