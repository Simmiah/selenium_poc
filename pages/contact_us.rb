# filename: contact_us.rb

require_relative 'base_page'

class ContactUs < BasePage

	HEADING = { css: 'h1.page-heading' }
	HEADING_TEXT = 'Customer service - Contact us'

	def initialize(driver)
		super
		visit('/index.php?controller=contact')
	end

	def contact_us_header_displayed?
		wait_for(10) {text_includes?(HEADING_TEXT, HEADING)}
	end

	



end