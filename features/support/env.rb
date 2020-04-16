require 'rubygems'
require 'active_support'
require 'active_support/all'
require 'capybara'
require 'capybara/cucumber'
require 'require_all'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require 'capybara/poltergeist'
require 'webdrivers'
require 'waitutil'
require_relative 'helpers'
include Helpers

ENV["BASE_URL"] ||= 'https://casebook.qa.citizensadvice.org.uk/'
ENV['WAIT_TIME'] ||= '10'


Capybara.configure do |config|
  config.default_driver = ENV["DRIVER"].to_sym
  config.app_host = ENV["BASE_URL"]
  config.exact = true
  config.ignore_hidden_elements = false
  config.visible_text_only = true
end

Capybara.register_driver(:chrome) do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver(:safari) do |app|
  Capybara::Selenium::Driver.new(app, browser: :safari)
end

Dir.mkdir("reports") unless File.directory?("reports")
Capybara.javascript_driver = ENV["DRIVER"].to_sym
