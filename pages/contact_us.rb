# filename: contact_us.rb

require_relative 'base_page'

class ContactUs < BasePage

	HEADING = { css: 'h1.page-heading' }
	HEADING_TEXT = 'Customer service - Contact us'
	# subject heading dropdown
	SUBJECT_HEADING = { id: 'id_contact' }
	SUBJECT_HEADING_CHOOSE = '-- Choose --'
	SUBJECT_HEADING_SERVICE = 'Customer service' 
	SUBJECT_HEADING_WEBMASTER = 'Webmaster'
	SUBJECT_HEADING_SPAN = { css: '#uniform-id_contact > span'}


	def initialize(driver)
		super
		visit('/index.php?controller=contact')
	end

	def contact_us_header_displayed?
		wait_for(10) {text_includes?(HEADING_TEXT, HEADING)}
	end

	def select_subject_header_updates_span?
		select_option(SUBJECT_HEADING, :text, SUBJECT_HEADING_SERVICE)
		wait_for(10) {text_includes?(SUBJECT_HEADING_SERVICE, SUBJECT_HEADING_SPAN)}
		select_option(SUBJECT_HEADING, :text, SUBJECT_HEADING_WEBMASTER)
		wait_for(10) {text_includes?(SUBJECT_HEADING_WEBMASTER, SUBJECT_HEADING_SPAN)}
		select_option(SUBJECT_HEADING, :text, SUBJECT_HEADING_CHOOSE)
		wait_for(10) {text_includes?(SUBJECT_HEADING_CHOOSE, SUBJECT_HEADING_SPAN)}
	end


end