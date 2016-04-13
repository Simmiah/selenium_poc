# filename: contact_us.rb

require_relative 'base_page'

class ContactUs < BasePage

	HEADING = { css: 'h1.page-heading' }
	HEADING_TEXT = 'Customer service - Contact us'
	# error message
	INVALID = { css: 'div.alert-danger > ol > li' }
	INVALID_EMAIL = 'Invalid email address.'
	INVALID_SUBJECT = 'Please select a subject from the list provided.'
	INVALID_MESSAGE = 'The message cannot be blank.'
	# subject heading dropdown
	SUBJECT_HEADING = { id: 'id_contact' }
	SUBJECT_HEADING_CHOOSE = '-- Choose --'
	SUBJECT_HEADING_SERVICE = 'Customer service' 
	SUBJECT_HEADING_WEBMASTER = 'Webmaster'
	SUBJECT_HEADING_SPAN = { css: '#uniform-id_contact > span'}
	# email address
	EMAIL = { id: 'email' }
	# order
	ORDER = { id: 'id_order' }
	# file
	FILE = { id: 'fileUpload' }
	# message
	MESSAGE = { id: 'message' }
	# send
	SEND = { id: 'submitMessage' }

	def initialize(driver)
		super
		visit('/index.php?controller=contact')
	end

	def contact_us_header_displayed?
		wait_for(10) {text_includes?(HEADING_TEXT, HEADING)}
	end

	def select_choose
		select_option(SUBJECT_HEADING, :text, SUBJECT_HEADING_CHOOSE)
	end

	def select_service
		select_option(SUBJECT_HEADING, :text, SUBJECT_HEADING_SERVICE)
	end

	def select_webmaster
		select_option(SUBJECT_HEADING, :text, SUBJECT_HEADING_WEBMASTER)
	end

	def enter_email(email)
		type(email, EMAIL)
	end

	def enter_order(order)
		type(order, ORDER)
	end

	def attach_file(filename)
		upload_file(filename, FILE)
	end

	def enter_message(message)
		type(message, MESSAGE)
	end

	def send_message
		submit(SEND)
	end

	def choose_displayed?
		wait_for(10) {text_includes?(SUBJECT_HEADING_CHOOSE, SUBJECT_HEADING_SPAN)}
	end

	def service_displayed?
		wait_for(10) {text_includes?(SUBJECT_HEADING_SERVICE, SUBJECT_HEADING_SPAN)}
	end

	def webmaster_displayed?
		wait_for(10) {text_includes?(SUBJECT_HEADING_WEBMASTER, SUBJECT_HEADING_SPAN)}
	end

	def invalid_email_displayed?
		
	end

	def blank_message_error_displayed?

	end

end