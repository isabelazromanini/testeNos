require 'cucumber'
require 'cpf_cnpj'
require 'rspec'
require 'rspec/retry'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/dsl'
require 'site_prism'
require 'pry'
require 'rubocop'
require 'fileutils'
require 'faker'
require 'timeout'
require_relative 'data'
require_relative 'page_helper'
require 'report_builder'
require 'date'

# CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/environments/url.yml"))

ENVIRONMENT_TYPE = ENV.fetch('ENVIRONMENT_TYPE', nil)
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")
BROWSER = ENV['BROWSER']

case ENV.fetch('BROWSER', nil)
when 'firefox'
  @driver = :selenium
when 'chrome'
  @driver = :selenium_chrome
when 'headless'
  Capybara.register_driver :selenium_chrome_headless do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new.tap do |options|
      options.add_argument '--headless'
      options.add_argument '--disable-gpu'
      options.add_argument '--no-sandbox'
      options.add_argument '--disable-site-isolation-trials'
    end
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: chrome_options)
  end
  @driver = :selenium_chrome_headless
when 'remote_chrome'
  Capybara.register_driver :selenium_remote do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => {'args' => ['disable-infobars']})
    Capybara::Selenium::Driver.new(app,
                                   browser: :remote, url: 'http://10.1.155.5:4444/wd/hub',
                                   desired_capabilities: capabilities)
  end
  @driver = :selenium_remote
else
  puts 'Invalid browser'
end
Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 30
end
World(Capybara::DSL)
World(DataLoad)
World(PageObjects)
