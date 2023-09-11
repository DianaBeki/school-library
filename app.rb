require_relative 'book'
require_relative 'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'option'

module UserInput
  def user_input(messages)
    inputs = []
    messages.each do |msg|
      print "#{msg}: "
      inputs.push(gets.chomp)
    end
    inputs
  end
end

class App
  include UserInput
  attr_accessor :rentals, :students, :books, :persons

  def initialize
    @persons = []
    @books = []
    @rentals = []
    @students = []
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    input_result = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp

    case input_result
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    else
      puts 'Invalid input. Please choose 1 for student or 2 for teacher.'
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    permission = %w[Y y].include?(permission)
    @persons << Student.new(age, name, parent_permission: permission)
    puts 'Student created successfully'
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    @persons << Teacher.new(age, specialization, name)
    puts 'Teacher created successfully'
  end

  def list_persons
    @persons.each do |person|
      display_person(person)
    end
  end

  # Other methods (create_book, list_books, create_rental, list_rentals_by_person, etc.)

  def display_person(person)
    puts "[#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def list_books
    puts 'List of Books:'
    @books.each do |book|
      display_books(book)
    end
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index}) #{book.title} by #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id):'
    @persons.each_with_index do |person, index|
      puts "#{index}) #{person.name} (ID: #{person.id})"
    end

    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, @books[book_index], @persons[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals_by_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    person = @persons.find { |p| p.id == person_id }
    rentals = @rentals.select { |r| r.person == person }

    puts "Rentals for #{person.name} (ID: #{person.id}):"
    rentals.each do |r|
      puts "Date: #{r.date}, Book: #{r.book.title} by #{r.book.author}"
    end
  end

  def display_books(book)
    puts "Title: \"#{book.title}\", Author: #{book.author}"
  end
end
