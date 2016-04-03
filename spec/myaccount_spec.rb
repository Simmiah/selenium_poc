# filename: myaccount_spec.rb

require_relative 'spec_helper'
require_relative '../pages/my_account'

describe 'My Account' do

	before(:each) do
		@myaccount = MyAccount.new(@driver)
		puts "trying login"
		@myaccount.login
	end

	it '' do
	end

=begin
	it 'should show all my account sections' do
		@myaccount.order_history_displayed?
		@myaccount.my_credit_displayed?
		@myaccount.my_addresses_displayed?
		@myaccount.my_information_displayed?
		@myaccount.my_wishlists_displayed?
	end
=end


end