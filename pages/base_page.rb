# filename: base_page.rb

require 'selenium-webdriver'

class BasePage

  # reusable login
  LOGIN_BUTTON = { css: 'a.login' }
  EMAIL_ADDRESS = { id: 'email' }
  PASSWORD = { id: 'passwd' }
  SIGN_IN = { id: 'SubmitLogin' }
  # credentials
  MY_EMAIL = 'rosalyn.goh@gmail.com'
  MY_PASSWORD = 'Test@123'

  def initialize(driver)
    @driver = driver
  end

  def login #use before each login required test
    @driver.get(ENV['public'] + ENV['base_url'] + '')
    @driver.find_element(LOGIN_BUTTON).click
    @driver.find_element(EMAIL_ADDRESS).send_keys(MY_EMAIL)
    @driver.find_element(PASSWORD).send_keys(MY_PASSWORD)
    @driver.find_element(SIGN_IN).click
  end

  def visit(url_path)
    @driver.get(ENV['public'] + ENV['base_url'] + url_path)
  end

  def find(locator)
    @driver.find_element(locator)
  end

  def type(text, locator)
    find(locator).send_keys(text)
  end

  def click(locator)
    find(locator).click
  end

  def submit(locator)
    find(locator).submit
  end

  def is_displayed?(locator)
    begin
      find(locator).displayed?
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
    end
  end

  def text(locator)
    find(locator).text
  end

  def text_includes?(text_wanted, locator)
    text_found = text(locator)
    text_found.include?(text_wanted)
  end

  def url_equals?(url_wanted)
    @driver.current_url.eql?(url_wanted)
  end

  def wait_for(seconds = 15)
    Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
  end

  def select(locator)
    Selenium::WebDriver::Support::Select.new(find(locator))
  end

  def select_option(select_locator, option_how, option_locator)
    select(select_locator).select_by(option_how, option_locator)
  end

  def file(filename)
    file = File.join(Dir.pwd, filename)
  end

  def upload_file(filename, locator)
    find(locator).send_keys file(filename)
  end

end