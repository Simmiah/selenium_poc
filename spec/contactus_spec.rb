# filename: contactus_spec.rb

require_relative 'spec_helper'
require_relative '../pages/contact_us'

describe 'Contact Us' do

	before(:each) do
		@contactus = ContactUs.new(@driver)
	end

	it 'should show contact us header' do
		expect(@contactus.contact_us_header_displayed?).to be true
	end

	



end