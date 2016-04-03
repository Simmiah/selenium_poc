# filename: myaccount_spec.rb

require_relative 'spec_helper'
require_relative '../pages/my_account'

describe 'My Account' do

	before(:each) do
		@myaccount = MyAccount.new(@driver)
		@myaccount.login
	end

	it 'should show all my account sections' do
		expect(@myaccount.home_icon_displayed?).to be true
		expect(@myaccount.order_history_displayed?).to be true
		expect(@myaccount.my_credit_displayed?).to be true
		expect(@myaccount.my_addresses_displayed?).to be true
		expect(@myaccount.my_information_displayed?).to be true
		expect(@myaccount.my_wishlists_displayed?).to be true
	end

	it 'should let me navigate home when clicking home icon link' do
		@myaccount.click_home_icon
		expect(@myaccount.on_home_url?).to be true
	end

	it 'should let me navigate home when clicking home link' do
		@myaccount.click_home_link
		expect(@myaccount.on_home_url?).to be true
	end

end