require 'json'
require_relative 'movies.rb'
# require_relative '../data/movies.json'

class Shows
  # attr_accessor :name, :audi, :price, :available_shows

  # def initialize(name, audi, price, available_shows)
  #   @name = name
  #   @audi = audi
  #   @price = price
  #   @available_shows = available_shows
  # end

  def load_movies(file_path)
    data = JSON.parse(File.read(file_path))
    data.map do |movies_data|
      Movies.new(
        movies_data['name'],
        movies_data['audi'],
        movies_data['price'],
        movies_data['available_shows']
      )
    end
  end

  def show_details(movies)
    movies.each_with_index do |movie, index|
      puts "#{index + 1}. Movie: #{movie.name} \n   Audi: #{movie.audi} \n   Price: #{movie.price} \n   Available Shows:" 
      movie.available_shows.each_with_index { |show, i| puts "      #{i + 1}. Shift: #{show['shift']} | Seats left: #{show['available_seats']}\n" }

      puts "--------------------------------------------------------"
    end
  end

  def show_names(movies)
    movies.each_with_index do |movie, index|
      print "  #{index + 1}. Movie: #{movie.name}  "
    end
  end
end

# shows = Shows.new
# movies_file = "../data/movies.json"
# movies = shows.load_movies(movies_file)

# shows.show_details(movies)


