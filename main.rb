require_relative 'app'
require_relative 'option'

app = App.new
option = List.new

class Main
  def main(app, option)
    puts "Welcome to School Library App!\n\n"

    loop do
      puts 'Choose an option:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'

      user_input = gets.chomp.to_i
      if user_input == 7
        print 'Thank you for using this app!'
        break
      end
    end
  end
end

Main.new.main(app, option)
