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

	it 'should update the heading dropdown when selected' do
		@contactus.choose_displayed?
		@contactus.service_displayed?
		@contactus.webmaster_displayed?
	end
=end
	it 'should upload a file' do
		@contactus.select_service
		@contactus.enter_email('test@test.com')
		@contactus.attach_file('/files/file.txt')
		@contactus.enter_message('test')
		@contactus.send_message
		expect(@contactus.success_displayed?)
	end




end