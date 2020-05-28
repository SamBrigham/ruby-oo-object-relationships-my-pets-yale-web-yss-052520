require 'pry'
require_relative "owner.rb"
require_relative "dog.rb"


class Cat
attr_accessor :owner, :mood #are to be initialized and there's nothing else in the program asking for a getter
attr_reader :name #makes it so name can't be changed, ask why
@@all = [] #empty class variable
  def initialize(name, owner) 
    @name = name
    @owner = owner
    @mood = "nervous"  #setting initial mood to be nervous, can be changed
    @@all << self
  end
  
  def self.all #class method to show it knows all cats and returns it
    @@all
  end

end