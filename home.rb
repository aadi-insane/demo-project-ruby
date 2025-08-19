require 'json'

require_relative 'model/movies.rb'
require_relative 'model/shows.rb'
require_relative 'model/bookings.rb'

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

def cancelation
  puts "Cancelation"
end

def show_bookings
  # puts "Show Bookings"
  
  booking_file = "./data/bookings.json"
  tickets = Bookings.load_bookings(booking_file)

  Bookings.show_details(tickets)
end


puts "==================== Welcome to Cinemax Booking System ===================="
while true
  puts
  puts "For available shows, press '1'"
  puts "For New Booking, press '2'"
  puts "For Cancelation press '3'"
  puts "For Booking List, press '4'"
  puts "For Exit, press '5'"
  puts "----------------------------------------------"
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
    cancelation
  when 4
    show_bookings
  when 5
    puts "Bye-Bye, Thank You! for using Cinemax Booking System."
    return
  else
    puts "Invalid input, Please try again!"
  end
end