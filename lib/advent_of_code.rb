# frozen_string_literal: true

require 'pry'
Dir['./lib/**/*.rb'].sort.each { |file| require file }
