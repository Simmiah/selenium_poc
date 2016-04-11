# filename: contactus_spec.rb

require_relative 'spec_helper'
require_relative '../pages/contact_us'

describe 'Contact Us' do

	before(:each) do
		@contactus = ContactUs.new(@driver)
	end
=begin
	it 'should show contact us header' do
		expect(@contactus.contact_us_header_displayed?).to be true
	end
=end
	it 'should select all subject header options' do
		expect(@contactus.select_subject_header_updates_span?).to be true
	end




end