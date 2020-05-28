require 'pry'
require_relative "owner.rb"
require_relative "cat.rb"
#see cat notes

class Dog
attr_accessor :owner, :mood
attr_reader :name

@@all = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous" #initiating dog w nervous mood
    @@all << self
  end

  def self.all
    @@all
  end

end