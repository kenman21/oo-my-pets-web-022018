require 'pry'

class Owner

  attr_reader :species
  attr_accessor :name, :pets

  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def self.count
    @@count
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes].push(fish)
    fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats].push(cat)
    cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs].push(dog)
    dog
  end

  def walk_dogs
    @pets[:dogs].each {|dog| dog.mood= "happy"}
  end

  def play_with_cats
    @pets[:cats].each {|cat| cat.mood= "happy"}
  end

  def feed_fish
    @pets[:fishes].each {|fish| fish.mood= "happy"}
  end

  def sell_pets
    @pets.each do |types, animals|
      animals.each {|animal| animal.mood="nervous"}
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    numbers = []
    @pets.each do |types, animals|
      numbers << animals.size
    end
    "I have #{numbers[0]} fish, #{numbers[1]} dog(s), and #{numbers[2]} cat(s)."
  end

end
