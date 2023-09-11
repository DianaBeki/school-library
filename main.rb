require_relative 'app'
require_relative 'option'

App.new

def main(app)
  puts "Welcome to School Library App! \n\n"

  loop do
    puts 'Choose an option:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    number = gets.chomp
    break if number == 7

    option(app, number)
  end
end
