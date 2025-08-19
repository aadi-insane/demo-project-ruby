class Movies
  attr_accessor :name, :audi, :price, :available_shows, :booked

  def initialize(name, audi, price, available_shows)
    @name = name
    @audi = audi
    @price = price
    @available_shows = available_shows
  end

  # def add_movie(name, audi, price, available_shows, file_path)
  #   data = JSON.parse(File.open(file_path, "a"))
  #   movies_data = data.map do |movie_data|
  #     puts 
      
  #   end


  #   puts "Movie: #{@name} is added in Audi: #{@audi} with Available Shows:"
  #   @available_shows.each_with_index do |show, index|
  #     puts "  Show #{index + 1}: #{show[:shift]} (Seats: #{show[:available_seats]})"
  #   end
  # end

  # def delete_movie
  #   puts "Movie: #{@name} is deleted in Audi: #{@audi} with Available Shows:"
  #   @available_shows.each_with_index do |show, index|
  #     puts "  Show #{index + 1}: #{show[:shift]} (Seats: #{show[:available_seats]})"
  #   end
  # end

  # def show_details(movie_data)
  #   puts "Movie: #{@name} \nAudi: #{@audi} \nPrice: #{@price} \nAvailable Shows:"
  #   @available_shows.each_with_index do |show, index|
  #     puts "  Show #{index + 1}: #{show[:shift]} (Seats: #{show[:available_seats]})"
  #   end
  # end
end

# interstraller = Movies.new(
#   "Interstraller",
#   1,
#   [{ shift: "09:00 AM to 12:00 PM", available_seats: 10 },{ shift: "12:00 PM to 03:00 PM", available_seats: 15 }]
#   )
# interstraller.add_movie

