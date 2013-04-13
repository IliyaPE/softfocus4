# encoding: utf-8

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/poltergeist'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

Capybara.javascript_driver = :poltergeist

Paperclip.options[:log] = false

RSpec.configure do |config|
  config.infer_base_class_for_anonymous_controllers = false
end

def new_image opts = {}
  Image.new({:file => File.open("spec/fixtures/jpn_すべての人間は.png"), :owner_attributes => {:ip => '127.0.0.1'}}.merge(opts))
end