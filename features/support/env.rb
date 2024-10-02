require 'cucumber'
require 'httparty'
require 'rspec'
require 'yaml'
require 'faker'
require 'cpf_faker'
require 'json'
require 'jsonpath'
require 'json-schema'
require 'pry'
require_relative 'page_objects'
require_relative "#{Dir.pwd}/features/class/upload_files.rb"

World(PageObjects)
World(UploadFiles)

ENVIRONMENT_TYPE ||= ENV['ENVIRONMENT_TYPE']
CONFIG = YAML.load_file("./features/support/config/#{ENV['ENVIRONMENT_TYPE']}.yml")
