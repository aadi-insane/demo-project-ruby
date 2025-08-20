require 'json'
require_relative 'bookings'

class Cancelation
  attr_accessor :id, :c_name, :movie, :audi, :show, :price, :seats

  def initialize(id, c_name, movie, audi, show, price, seats)
    @id = id
    @c_name = c_name
    @movie = movie
    @audi = audi
    @show = show
    @price = price    
    @seats = seats
  end

  def self.canel_ticket(booking_file, movies_file)
    # puts "Canceling Your ticket!"
    booking_data = JSON.parse(File.read(booking_file))
    booking_list = booking_data.map do |b|
      Bookings.new(b['id'], b['c_name'], b['movie'], b['audi'], b['show'], b['price'], b['seats'])
    end

    movies_data = JSON.parse(File.read(movies_file))
    
    booking_ids = []

    puts "Which booking you wish to CANCEL?"
    puts 
    booking_list.each_with_index do |tickets, index|
      puts "#{index + 1}.  ID:     #{tickets.id}\n    Name:   #{tickets.c_name}\n    Movie:  #{tickets.movie}\n    Audi:   #{tickets.audi},    Seat(s): #{tickets.seats}\n    Show:   #{tickets.show}\n    Total Amount: #{tickets.price}/-"
      puts "=========================================="
      booking_ids.push(tickets.id)
    end
    
    loop do
      print "\nEnter Booking ID: "
      id_choice = gets.chomp

      if !booking_ids.include?(id_choice)
        puts "Incorrect Booking ID, Please try again"
      else
        # puts "Correct ID"
        # puts booking_data.inspect
        movie_name = nil
        $amount = nil
      
        booking_data.each_with_index do |ticket, index|
          if ticket['id'] == id_choice
            # puts ticket
            movie_name = ticket['movie']
            $amount = ticket['price']
            booking_data.delete_at(index)
            File.open(booking_file, "w") do |file|
              file.write(JSON.pretty_generate(booking_data))
            end

            movies_data.each_with_index do |movie, index|
            # puts movie
            # puts "__________"
            # puts "All Movie Name: #{movie['name']}"
            # puts "Booked Movie Nmae: #{$movie_name}"
        
          
              if movie['name'] == movie_name
                avail_str = movie['available_shows']
                # puts "Avail Str - #{avail_str} and #{avail_str.class}"

                avail_str.each_with_index do |hash, index|
                  if hash['shift'] == ticket['show']
                    old_seats = hash['available_seats']
                    hash['available_seats'] = old_seats + ticket['seats']
                  end
                end

                # avail_hash = avail_str.inject(Hash.new(0)) { |data, hash| hash.merge!(data) }


                # puts "Avail hash old - #{avail_hash} and #{avail_hash.class}"
                # old_seats = avail_hash['available_seats']
                # # puts "Old avail Seats: #{old_seats}"
                # # puts "Booked Seats: #{booked_seats}"
                # updated_seats = old_seats + booked_seats
                # # puts "New avail Seats: #{old_seats}"
                # avail_hash['available_seats'] = updated_seats   
                # puts "Avail hash New - #{avail_hash} and #{avail_hash.class}"        

                File.open(movies_file, "w") do |file|
                  file.write(JSON.pretty_generate(movies_data))
                end
              end
            end
            puts "    ______________________________________"
            puts "    |                                    |"
            puts "    |  Ticket #{id_choice} is canceled!        |"
            puts "    |      #{$amount}/- is Refunded.            |"
            puts "    |____________________________________|"
            puts
            puts "=========================================="
          end
        end
        break
      end
    end
    puts

  end
end

# Cancelation.canel_ticket("../data/bookings.json", "../data/movies.json")