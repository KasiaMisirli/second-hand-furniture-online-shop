require 'pry'
require 'active_record'
ActiveRecord::Base.logger = Logger.new(STDERR) #log sql for me
require_relative 'db_config'
require_relative 'models/user'
require_relative 'models/item'
require_relative 'models/image'

binding.pry