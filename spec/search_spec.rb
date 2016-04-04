# filename: search_spec.rb

require_relative 'spec_helper'
require_relative '../pages/search'

describe 'Search' do

	before(:each) do
		@search = Search.new(@driver)
	end
=begin
	it 'should show autocomplete dresses when entering dre' do
		@search.search_text('dre')
		expect(@search.autocomplete_results_displayed?).to be true
	end

	it 'should not show autocomplete results when entering dr' do
		@search.search_text('dr')
		expect(@search.autocomplete_results_displayed?).to be false
	end

	it 'should not show autocomplete results when entering aaa' do
		@search.search_text('aaa')
		expect(@search.autocomplete_results_displayed?).to be false
	end

	it 'for aaa returns zero results' do
		@search.search_text('aaa')
		@search.click_search_button
		expect(@search.no_results_displayed?).to be true
	end
=end

	it 'with no keyword shows keyword message' do
		@search.click_search_button
		expect(@search.enter_search_message_displayed?).to be true
	end

end