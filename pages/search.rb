# filename: search.rb

require_relative 'base_page'

class Search < BasePage

  SEARCH = { id: 'search_query_top' }
  AUTOCOMPLETE_RESULTS = { css: 'div.ac_results' }
  SEARCH_BUTTON = { css: 'button.button-search' }
  HEADING_COUNTER = { css: 'span.heading-counter' }
  NO_RESULTS = '0 results have been found.'
  SEARCH_ALERT = { css: 'p.alert-warning' }
  SEARCH_KEYWORD = 'Please enter a search keyword'
  SEARCH_RESULTS = { css: 'ul.product_list' }

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
    text_includes?(NO_RESULTS, HEADING_COUNTER)
  end

  def enter_search_message_displayed?
    wait_for(10) {is_displayed?(SEARCH_ALERT)}
    text_includes?(SEARCH_KEYWORD, SEARCH_ALERT)
  end

  def search_results_displayed?
    wait_for(10) {is_displayed?(SEARCH_RESULTS)}
  end

end