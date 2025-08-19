require 'json'
require_relative "movies"

class Bookings
  attr_accessor :id, :c_name, :movie, :audi, :show, :price, :seats

  def initialize(c_name, movie, audi, show, price, seats)
    @id = generate_id
    @c_name = c_name
    @movie = movie
    @audi = audi
    @show = show
    @price = price    
    @seats = seats
  end

  # def load_movies(file_path)
  #   data = JSON.parse(File.read(file_path))
  #   data.map do |movies_data|
  #     Movies.new(
  #       movies_data['name'],
  #       movies_data['audi'],
  #       movies_data['price'],
  #       movies_data['available_shows']
  #     )
  #   end
  # end
  
  def self.load_bookings(file_path)
    data = JSON.parse(File.read(file_path))
    data.map do |bookings_data|
      Bookings.new(
        bookings_data['id'],
        bookings_data['c_name'],
        bookings_data['movie'],
        bookings_data['audi'],
        bookings_data['show'],
        bookings_data['price'],
        bookings_data['seats']
      )
    end
    # puts data.inspect
  end

  def self.show_details(tickets)
    tickets.each_with_index do |tickets, index|
      puts "#{index + 1}. Booking ID: #{tickets.id} \n   Name: #{tickets.c_name} \n   Movie: #{tickets.movie} \n   Audi: #{tickets.audi} \n   Price: #{tickets.price} \n   Shows: #{tickets.show}" 
     
      puts "--------------------------------------------------------"
    end
  end

  # def self.book_ticket(booking_file, movies_file)

  #   bookings_string = File.read(booking_file)
  #   booking_data = JSON.parse(bookings_string)

  #   print "Enter Customer's Name: "
  #   c_name = gets.chomp.to_s
  #   puts

  #   print "Enter Movie Name: "
  #   movie = gets.chomp
  #   puts

  #   print "Enter Audi Number: "
  #   audi = gets.chomp
  #   puts

  #   print "Enter Show Time: "
  #   show = gets.chomp
  #   puts

  #   print "Enter Price: "
  #   price = gets.chomp
  #   puts

  #   print "Enter Seats: "
  #   seats = gets.chomp
  #   puts

  #   new_booking = {
  #     "c_name" => c_name,
  #     "movie" => movie,
  #     "audi" => audi,
  #     "show" => show,
  #     "price" => price,
  #     "seats" => seats
  #   }

  #   booking_data.push(new_booking)

  #   File.open(booking_file, "w") do |file|
  #     file.write(JSON.pretty_generate(booking_data))
  #   end

  #   puts "Booking successfully saved!"
  # end


  def self.book_ticket(booking_file, movies_file)
    bookings_string = File.read(booking_file)
    booking_data = JSON.parse(bookings_string)

    movies_data = JSON.parse(File.read(movies_file))
    movies_list = movies_data.map do |m|
      Movies.new(m['name'], m['audi'], m['price'], m['available_shows'])
    end

    print "Enter Customer's Name: "
    c_name = gets.chomp.strip
    puts

    movie = nil
    loop do
      puts "Available Movies:"
      movies_list.each_with_index do |m, index|
        puts "#{index + 1}. #{m.name} (Audi: #{m.audi}, Price: #{m.price})"
      end
      print "Select Movie (Enter number 1-#{movies_list.length}): "
      movie_input = gets.chomp.strip
      
      if movie_input.to_i.to_s == movie_input && (1..movies_list.length).include?(movie_input.to_i)
        movie = movies_list[movie_input.to_i - 1]
        break
      else
        puts "Invalid selection. Please enter a number between 1 and #{movies_list.length}."
        puts
      end
    end
    puts "Selected Movie: #{movie.name}"
    puts

    audi = movie.audi.to_s.to_i
    puts "Audi: #{audi}"
    puts

    available_shifts = movie.available_shows

    show = nil
    loop do
      puts "Available Show Times:"
      available_shifts.each_with_index do |shift_info, index|
        puts "#{index + 1}. #{shift_info['shift']} (Available Seats: #{shift_info['available_seats']})"
      end
      print "Select Show Time (Enter number 1-#{available_shifts.length}): "
      show_input = gets.chomp.strip
      
      if show_input.to_i.to_s == show_input && show_input.to_i.between?(1, available_shifts.length)
        
        selected_show_hash = available_shifts[show_input.to_i - 1] 

        show = selected_show_hash['shift'] 
        break
      else
        puts "Invalid selection. Please enter a number between 1 and #{available_shifts.length}."
        puts
      end

    end
    puts "Selected Show Time: #{show}"
    puts

    price = movie.price
    puts "Price for this booking: #{price}"
    puts

    seats = nil
    loop do
      print "Enter number of Seats: "
      seats_input = gets.chomp.strip
      if seats_input.to_i.to_s == seats_input && seats_input.to_i > 0
        seats = seats_input.to_i
        break
      else
        puts "Invalid seats number. Please enter a positive integer."
      end
    end
    puts

    new_booking = {
      "id" => Bookings.generate_id,
      "c_name" => c_name,
      "movie" => movie.name,
      "audi" => audi,
      "show" => show,
      "price" => price,
      "seats" => seats
    }

    booking_data.push(new_booking)

    File.open(booking_file, "w") do |file|
      file.write(JSON.pretty_generate(booking_data))
    end

    puts "Booking successfully saved!"
    puts 
  end

  def self.generate_id
    "BK" + rand(1000..9999).to_s
    # puts "BK" + rand(1000..9999).to_s
  end

end


# bookings = Bookings.new
# booking_file = "../data/bookings.json"
# tickets = Bookings.load_bookings(booking_file)

# all_bookings = Bookings.show_details(tickets)

# puts tickets
# bookings.show_details(tickets)

Bookings.book_ticket("../data/bookings.json", "../data/movies.json")

# Bookings.generate_id