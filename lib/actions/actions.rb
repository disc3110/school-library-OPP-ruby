require_relative '../book'
require_relative '../classroom'
require_relative '../corrector'
require_relative '../person'
require_relative '../rental'
require_relative '../student'
require_relative '../teacher'

class Actions
  attr_accessor :keep_going, :book_colection, :people

  def initialize()
    @keep_going = true
    @book_colection = []
    @people = []
    @rentals = []
  end

  def list_books
    @book_colection.each { |x| puts "Title: #{x.title}  Author: #{x.author}" }
  end

  def list_people
    @people.each { |x| puts " [#{x.class}] Name: #{x.name}, ID #{x.id}, Age: #{x.age}" }
  end

  def create_person()
    p('Do you want to create a student(1) or a teacher(2) [INPUT THE NUMBER]')
    p_role = gets.chomp
    p('Whats the name of the person?')
    @p_name = gets.chomp
    p('Whats the age of the person?')
    @p_age = gets.chomp
    p('Has parent permission? [Y/N]')
    @p_permission = gets.chomp
    case p_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      p('Invalid')
    end
  end

  def create_student()
    newperson = Student.new(age: @p_age, name: @p_name, parent_permission: @p_permission)
    @people.push(newperson)
    puts "#{newperson.name} has been created"
  end

  def create_teacher()
    p('What specialization does he/she has?')
    specialization = gets.chomp
    newperson = Teacher.new(age: @p_age, name: @p_name, parent_permission: @p_permission,
                            specialization: specialization)
    @people.push(newperson)
    puts "#{newperson.name} has been created"
  end

  def create_book
    p('Whats the title of the book?')
    newtitle = gets.chomp
    p('Who is the author of the book?')
    newauthor = gets.chomp
    newbook = Book.new(newtitle, newauthor)
    @book_colection.push(newbook)
    puts 'Your book has been created'
  end

  def create_rental
    if @book_colection.length.positive? && @people.length.positive?
      p('Select a book of the following list of books')
      @book_colection.each_with_index do |book, idx|
        puts "#{idx + 1}) Title: \"#{book.title}\", Author: #{book.author}"
      end
      book_idx = gets.chomp.to_i - 1

      puts 'Select a person from the following list by number'
      @people.each_with_index do |person, idx|
        puts "#{idx + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
      person_idx = gets.chomp.to_i - 1

      print 'Date:'
      date = gets.chomp

      new_rental = Rental.new(date, @book_colection[book_idx], @people[person_idx])
      @rentals.push(new_rental)
      p('Rental created successfully')
    else
      p('You dont have enough data to create a rental please add books and people')
    end
  end

  def list_rentals
    print 'ID of person:'
    id = gets.chomp.to_i

    filtered_rentals = @rentals.filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    filtered_rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
