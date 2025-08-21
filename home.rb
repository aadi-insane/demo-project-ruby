require 'json'

require_relative 'model/movies.rb'
require_relative 'model/shows.rb'
require_relative 'model/bookings.rb'
require_relative 'model/cancelation.rb'
require_relative 'model/export_csv'

$movies_file = "./data/movies.json"
$booking_file = "./data/bookings.json"

def available_shows
  shows = Shows.new
  # movies_file = "./data/movies.json"
  movies = shows.load_movies($movies_file)

  shows.show_details(movies)
end

def new_booking
  # puts "New Booking"
  
  # shows = Shows.new
  # movies_file = "./data/movies.json"
  # movies = shows.load_movies(movies_file)
  # booking_file = "./data/bookings.json"
  # bookings = Bookings.load_bookings(booking_file)

  Bookings.book_ticket($booking_file, $movies_file)
end

def cancel
  # puts "Cancelation"
  # movies_file = "./data/movies.json"
  # booking_file = "./data/bookings.json"
  Cancelation.canel_ticket($booking_file, $movies_file)
end

def show_bookings
  # puts "Show Bookings"
  
  # booking_file = "./data/bookings.json"
  tickets = Bookings.load_bookings($booking_file)

  if tickets && !tickets.empty?
    Bookings.show_details(tickets)
  else
    puts "No Bookings Available!"
  end

end

def search_bookings
  # puts "Searching in bookings...."
  # booking_file = "./data/bookings.json"
  Bookings.search_bookings($booking_file)
end

def export_book
  # booking_file = "./data/bookings.json"
  ExportBookings.export($booking_file)
end


puts "==================== Welcome to Cinemax Booking System ===================="
while true
  puts
  puts "                    _____________________________________"
  puts "                    |                                   |"
  puts "                    |          SELECT YOUR MOVE         |"
  puts "                    | press '1' --- For Available shows |"
  puts "                    | press '2' --- To Book Ticket      |"
  puts "                    | press '3' --- To Cancel Ticket    |"
  puts "                    | press '4' --- For Booking List    |"
  puts "                    | press '5' --- To Search Booking   |"
  puts "                    | press '6' --- To Export Bookings  |"
  puts "                    | press '7' --- To Exit             |"
  puts "                    |___________________________________|"
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
    export_book
  when 7
    puts "Bye-Bye, Thank You! for using Cinemax Booking System."
    return
  else
    puts "Invalid input, Please try again!"
  end
end