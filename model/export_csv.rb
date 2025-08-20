require 'json'
require 'csv'
require 'fileutils' # Required for FileUtils.mkdir_p

class ExportBookings
  def self.export(booking_file)
    bookings_data = JSON.parse(File.read(booking_file))

    headers = bookings_data.first.keys

    # export_file = "../data/output.csv"
    export_file = "/home/rails/Aditya/Syllabus/demo-project-ruby/data/output.csv"
    
    export_dir = File.dirname(export_file)

    FileUtils.mkdir_p(export_dir) unless File.directory?(export_dir) 

    CSV.open(export_file, "w") do |file|
      file << headers
      bookings_data.each do |item|
        file << item.values_at(*headers)
      end
    end
    puts "Bookings exported to '/data/output.csv'"
  end
end
