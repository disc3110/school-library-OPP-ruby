require_relative '../lib/actions/actions'

class App
  def initialize()
    @actions = Actions.new
  end

  def init
    main while @actions.keep_going
  end

  def do_action(option)
    case option
    when '1'
      @actions.list_books
    when '2'
      @actions.list_people
    when '3'
      @actions.create_person
    when '4'
      @actions.create_book
    when '5'
      @actions.create_rental
    when '6'
      @actions.list_rentals
    else
      @actions.keep_going = false
    end
  end

  def main
    puts 'Welcome to School Library App!'
    puts 'Please choose an option by entering a number:
    1- List all books
    2- List all people
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit'

    choosen_option = 0

    until choosen_option.to_i >= 1 && choosen_option.to_i <= 7
      puts 'Write a number from 1-9 that represent the desire option'
      choosen_option = gets.chomp
    end
    do_action(choosen_option)
  end
end

app = App.new
app.init
