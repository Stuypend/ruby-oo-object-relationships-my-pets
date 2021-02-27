class Owner
  @@all = []

  attr_accessor :owner, :mood
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.count
    return @@all.size
  end

  def self.reset
    return @@all.clear
  end

  def cats
    Cat.all.select do
      |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do
    |dog|
      dog.owner == self
    end
  end

    def walk_dogs
      Dog.all.each do
        |dog|
        dog.mood = "happy"
      end
    end

      def feed_cats
        Cat.all.each do
        |dog|
          dog.mood = "happy"
        end
      end

      def sell_pets
        Cat.all.each do
        |dog|
          dog.mood = "nervous"
          dog.owner = nil
        end

        Dog.all.each do
        |dog|
          dog.mood = "nervous"
          dog.owner = nil
        end
      end

      def list_pets
        ("I have #{self.dogs.count} dog(s), and #{cats.count} cat(s).")
      end

  def self.reset_all
    @@all.clear
  end

  def say_species
    puts "I am a human."
    return "I am a human."
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

end