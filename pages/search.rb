# filename: search.rb

require_relative 'base_page'

class Search < BasePage

	SEARCH = { id: 'search_query_top' }
	AUTOCOMPLETE_RESULTS = { css: 'div.ac_results' }
	SEARCH_BUTTON = { css: 'button.button-search' }
	HEADING_COUNTER = { css: 'span.heading-counter' }
	SEARCH_ALERT = { css: 'p.alert-warning' }

	def initialize(driver)
		super
		visit('')
	end

	def search_text(text)
		type(text, SEARCH)
	end

	def autocomplete_results_displayed?
		wait_for(10) {is_displayed?(AUTOCOMPLETE_RESULTS)}
	end

	def click_search_button
		click(SEARCH_BUTTON)
	end

	def no_results_displayed?
		wait_for(10) {is_displayed?(HEADING_COUNTER)}
		text_is?('0 results have been found.', HEADING_COUNTER)
	end

	def enter_search_message_displayed?
		wait_for(10) {is_displayed?(SEARCH_ALERT)}
		text_is?('Please enter a search keyword', SEARCH_ALERT)
	end

end