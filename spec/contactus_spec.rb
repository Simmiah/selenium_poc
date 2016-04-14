# filename: contactus_spec.rb

require_relative 'spec_helper'
require_relative '../pages/contact_us'

describe 'Contact Us' do

  before(:each) do
    @contactus = ContactUs.new(@driver)
  end

  it 'should show contact us header' do
    expect(@contactus.contact_us_header_displayed?).to be true
  end

  it 'should update the heading dropdown when selected' do
    @contactus.select_choose
    @contactus.choose_displayed?
    @contactus.select_service
    @contactus.service_displayed?
    @contactus.select_webmaster
    @contactus.webmaster_displayed?
  end

  it 'should successfully send message' do
    @contactus.select_service
    @contactus.enter_email('test@test.com')
    @contactus.attach_file('/files/file.txt')
    @contactus.enter_message('test')
    @contactus.send_message
    expect(@contactus.success_displayed?)
  end

  it 'should show select subject error when not selected' do
    @contactus.enter_email('test@test.com')
    @contactus.enter_message('test')
    @contactus.send_message
    expect(@contactus.select_subject_error_displayed?)
  end

  it 'should show invalid email when blank' do
    @contactus.select_service
    @contactus.send_message
    expect(@contactus.invalid_email_displayed?)
  end

  it 'should show blank error when message blank' do
    @contactus.select_webmaster
    @contactus.enter_email('test@tes.com')
    @contactus.send_message
    expect(@contactus.blank_message_error_displayed?)
  end

end