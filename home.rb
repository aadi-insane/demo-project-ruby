require 'json'

require_relative 'model/movies.rb'
require_relative 'model/shows.rb'
require_relative 'model/bookings.rb'
require_relative 'model/cancelation.rb'

def available_shows
  shows = Shows.new
  movies_file = "./data/movies.json"
  movies = shows.load_movies(movies_file)

  shows.show_details(movies)
end

def new_booking
  # puts "New Booking"
  
  # shows = Shows.new
  movies_file = "./data/movies.json"
  # movies = shows.load_movies(movies_file)
  booking_file = "./data/bookings.json"
  # bookings = Bookings.load_bookings(booking_file)

  Bookings.book_ticket(booking_file, movies_file)
end

def cancel
  # puts "Cancelation"
  movies_file = "./data/movies.json"
  booking_file = "./data/bookings.json"
  Cancelation.canel_ticket(booking_file, movies_file)
end

def show_bookings
  # puts "Show Bookings"
  
  booking_file = "./data/bookings.json"
  tickets = Bookings.load_bookings(booking_file)

  if tickets && !tickets.empty?
    Bookings.show_details(tickets)
  else
    puts "No Bookings Available!"
  end

end

def search_bookings
  # puts "Searching in bookings...."
  booking_file = "./data/bookings.json"
  Bookings.search_bookings(booking_file)
end


puts "==================== Welcome to Cinemax Booking System ===================="
while true
  puts
  puts "                    ____________________________________"
  puts "                    |                                  |"
  puts "                    |        SELECT YOUR MOVE          |"
  puts "                    | For available shows----press '1' |"
  puts "                    | For New Booking--------press '2' |"
  puts "                    | For Cancelation--------press '3' |"
  puts "                    | For Booking List-------press '4' |"
  puts "                    | For Search Booking-----press '5' |"
  puts "                    | For Exit---------------press '6' |"
  puts "                    |__________________________________|"
  puts
  print "Enter Your choice: "

  choice = gets.chomp.to_i
  puts
  case choice
  when 1
    available_shows
  when 2
    new_booking
  when 3
    cancel
  when 4
    show_bookings
  when 5
    search_bookings
  when 6
    puts "Bye-Bye, Thank You! for using Cinemax Booking System."
    return
  else
    puts "Invalid input, Please try again!"
  end
end