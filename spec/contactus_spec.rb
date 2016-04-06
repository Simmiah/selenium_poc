# filename: contactus_spec.rb

require_relative 'spec_helper'
require_relative '../pages/contact_us'

describe 'Contact Us' do

	before(:each) do
		@contactus = ContactUs.new(@driver)
	end



end