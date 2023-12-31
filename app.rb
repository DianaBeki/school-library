require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'create'
require_relative 'data_operation'

class App
  attr_reader :people, :books, :rentals

  include SaveData
  include LoadData

  def initialize
    @books = load_books
    @people = load_people
    @rentals = load_rentals
    @welcome_text = "\nPlease choose an option by entering a number:
    1- List all books
    2- List all people
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit"
  end

  def add_person(person)
    @people.push(person)
  end

  def add_book(book)
    @books.push(book)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def list_books
    if @books.empty?
      puts 'Books list is empty!'
    else
      @books.each_with_index do |book, index|
        puts "#{index})- Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_people
    if @people.empty?
      puts 'People list is empty!'
    else
      @people.each_with_index do |person, index|
        if person.nil?
          puts "#{index})- [nil] Person is nil"
        else
          puts "#{index})- [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def list_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    person = @people.find { |p| p.id == id }

    if person.nil?
      puts "Person with ID #{id} not found."
    else
      puts 'Rentals: '
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end

  def pick_action(number)
    case number
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def run
    puts 'Welcome to School Library App!'
    exit = false
    until exit
      puts @welcome_text
      number = gets.to_i
      if number < 7
        pick_action(number)
      elsif number == 7
        exit = true
        save
        puts 'Thanks for using our school library app, see you soon, bye!'
      else
        puts "Error friend, wrong input. Sorry, I don't make the rules ¯\\(ツ)/¯"
      end
    end
  end
end
