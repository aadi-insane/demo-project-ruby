# Cinemax Booking System 
### Movie Ticket Booking System (CLI)

A command-line interface application for managing movie ticket bookings built with Ruby. This system allows users to view available shows, book tickets, cancel bookings, and manage their reservations.

## Features

The system provides the following functionality through an interactive menu:

```
                    _____________________________________
                    |                                   |
                    |          SELECT YOUR MOVE         |
                    | press '1' --- For Available shows |
                    | press '2' --- To Book Ticket      |
                    | press '3' --- To Cancel Ticket    |
                    | press '4' --- For Booking List    |
                    | press '5' --- To Search Booking   |
                    | press '6' --- To Export Bookings  |
                    | press '7' --- To Exit             |
                    |___________________________________|
```

### Menu Options

1. **Available Shows** - View all currently available movies and showtimes
2. **Book Ticket** - Make a new ticket reservation
3. **Cancel Ticket** - Cancel an existing booking
4. **Booking List** - View all current bookings
5. **Search Booking** - Search for specific bookings
6. **Export Bookings** - Export booking data to CSV format
7. **Exit** - Close the application

## Project Structure

```
demo-project-ruby/
├── home.rb              # Main application entry point
├── data/
│   ├── movies.json      # Movie and show data
│   ├── bookings.json    # Booking records
│   └── output.csv       # Exported booking data
├── model/
│   ├── movies.rb        # Movie data management
│   ├── shows.rb         # Show display functionality
│   ├── bookings.rb      # Booking operations
│   ├── cancelation.rb   # Ticket cancellation
│   └── export_csv.rb    # CSV export functionality
└── README.md
```

The application will display a welcome message and present the main menu. Simply enter the number corresponding to your desired action and follow the prompts.

## Data Storage

The application uses JSON files for data persistence:

- **movies.json**: Stores movie information and available shows
- **bookings.json**: Maintains all booking records
- **output.csv**: Generated when exporting booking data

## Features in Detail

### Available Shows
Displays all movies currently showing with their details including showtimes and availability.

### Book Ticket
Allows users to select a movie, showtime, and book tickets. The system updates the booking records automatically.

### Cancel Ticket
Enables users to cancel existing bookings by searching and selecting from their reservations.

### Booking Management
- View all bookings with detailed information
- Search functionality to find specific bookings
- Export capabilities for data backup or analysis
