
require 'pry'

require_relative "cat.rb"
require_relative "dog.rb"

class Owner

attr_reader :name, :species
                               #initializes w name set to species so needs accessor 
  @@all = []                  #doesn't request reader,writer, so use accessor
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
   "I am a #{self.species}." #instance method to say species referring to self instance bc in function
  end

  def self.all #class methods start with self-returns all of class
    @@all
  end

  def self.count #class method counting size of class
    @@all.size  
  end

  def self.reset_all #class method
    self.all.clear
  end
##ESP IMPORTANT FOR HAS/HAS MANY ETC
  def cats
    Cat.all.select {|cat| cat.owner == self} #for all instances of cat, iterates over it so owner#of the cats is owner
  end
  
  

  def dogs
    Dog.all.select {|dog| dog.owner == self} #same thing for dogs
  end
  


  def buy_cat(name) #an instance method for owner that creates a new instance of cat class
    Cat.new(name, self) #cat new (new a class method) for an owner of that name, belongs to owner
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"} #for each instance of self and gos withinin, change its mood
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    pets = self.dogs + self.cats #combining owners

    pets.each do|pet|
      pet.mood = "nervous"
      pet.owner = nil #owner isn't needed
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

