# filename: contact_us.rb

require_relative 'base_page'

class ContactUs < BasePage

	def initialize(driver)
		super
		visit('/index.php?controller=contact')
	end



end