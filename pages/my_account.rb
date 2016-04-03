# filename: my_account.rb

require_relative 'base_page'

class MyAccount < BasePage

	HOME_ICON_LINK = { css: '[title~=Return][title~=to][title~=home]' }
	HOME_ICON = { css: 'i.icon-home' }
	HOME_LINK = { css: '[title=Home' }
	HOME_URL = 'http://automationpractice.com/index.php'
	MY_ACCOUNT = { css: 'a.account' }
	ORDER_HISTORY = { css: '[title=Orders]' }
	MY_CREDIT = { css: '[title~=Credit]' }
	MY_ADDRESSES = { css: '[title=Addresses]' }
	MY_INFORMATION = { css: '[title=Information]' }
	MY_WISHLISTS = { css: '[title~=wishlists]' }


	def initialize(driver)
		super
	end

	def click_home_icon
		click(HOME_ICON_LINK)
	end

	def click_home_link
		click(HOME_LINK)
	end

	def click_my_account
		click(MY_ACCOUNT)
	end

	def on_home_url?
		wait_for(10) {url_is?(HOME_URL)}
	end

	def home_icon_displayed?
		wait_for(10) {is_displayed?(HOME_ICON)}
	end

	def order_history_displayed?
		wait_for(10) {is_displayed?(ORDER_HISTORY)}
	end

	def my_credit_displayed?
		wait_for(10) {is_displayed?(MY_CREDIT)}
	end

	def my_addresses_displayed?
		wait_for(10) {is_displayed?(MY_ADDRESSES)}
	end

	def my_information_displayed?
		wait_for(10) {is_displayed?(MY_INFORMATION)}
	end

	def my_wishlists_displayed?
		wait_for(10) {is_displayed?(MY_WISHLISTS)}
	end

end