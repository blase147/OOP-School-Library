require './rental'
require './student'
require './book'
require './teacher'
require './save_data'

class App
  attr_reader :book, :person, :rental

  include DataSaver

  def initialize
    @book = show_books
    @person = show_people
    @rental = show_rentals(@book, @person)
    @student_data = get_data('people')
    @teach_data = get_data('people')
    @book_data = get_data('books')
    @rental_data = get_data('rental')
  end

  def list_books
    if @book.empty?
      puts 'No books found in library'
    else
      book.each do |item|
        puts "Title: #{item.title}, Author: #{item.author}"
      end
    end
  end

  def list_people
    if @person.empty?
      puts 'No person found'
    else
      person.each do |item|
        puts "[#{item.class}] - Name: #{item.name}, Age: #{item.age}, ID: #{item.id}"
      end
    end
  end

  def handle_data(data, people)
    case people
    when 'student'
      student_data_hash = { id: data.id, name: data.name, age: data.age, class: 'student' }
      # $student_data = get_data('people')
      @student_data.push(student_data_hash)
    when 'teacher'
      teacher_data_hash = { id: data.id, name: data.name, age: data.age, class: 'teacher' }
      @teach_data.push(teacher_data_hash)
    end
  end

  def add_people
    puts 'press 1 to add a student or press 2 to add a teacher:'
    person_to_add = gets.chomp.to_i
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp

    case person_to_add
    when 1
      puts 'Do you have parent Permission? [Y/N]: '
      user_response = gets.chomp.capitalize
      user_permission = user_response == 'Y'
      @person << people_data = Student.new(nil, age, name, parent_permission: user_permission)
      handle_data(people_data, 'student')
    when 2
      puts 'Specialisation: '
      specialisation = gets.chomp
      @person << people_data = Teacher.new(specialisation, age, name)
      handle_data(people_data, 'teacher')
    end
    puts 'Person added successfully'
  end

  def add_book
    puts 'Please Add a book'
    puts 'Title :'
    title = gets.chomp.capitalize
    puts 'Author:'
    author = gets.chomp.capitalize
    @book << Book.new(title, author)
    book_info = Book.new(title, author)
    book_data_hash = { title: book_info.title, author: book_info.author }
    @book_data.push(book_data_hash)
    puts 'Book added successfully'
  end

  def add_rental
    puts 'Please select a book from the list by number'
    book.map.with_index { |item, index| puts "#{index} Title: #{item.title}',Auther:#{item.author}" }
    selected_book_id = gets.chomp.to_i
    selected_book = book[selected_book_id]
    puts "Choose a person from the list:(
      DON'T CHOOSE ID PLEASE)"
    person.map.with_index do |item, index|
      puts "#{index}, Name: #{item.name} Age: #{item.age}, ID:#{item.id}"
    end
    selected_person_id = gets.chomp.to_i
    selected_person = person[selected_person_id]

    puts 'Date?'
    selecteted_date = gets.chomp
    puts 'rental_data updated'
    @rental << Rental.new(date: selecteted_date, person_index: selected_person, book_index: selected_book)
    rental_data_hash = { date: selecteted_date, book_index: selected_book, person_index: selected_person }
    @rental_data.push(rental_data_hash)
  end

  def show_rental
    puts 'Person ID'
    selected_person_id = gets.chomp.to_i
    @rental.each do |item|
      next unless item.person.id.to_i == selected_person_id

      puts item.book.title
      puts item.person.name
      puts item.date
    end
  end

  def display_all
    puts 'Welcome to the school library'
    puts ' Please choose a task  basing on the number '
    puts "1: Show all books.
2: Show all people.
3: Create a person
4: Create a book
5: Create a rental
6: List rented books to a person by ID
7: Exit"
  end

  def exit_app
    puts 'I am glad you that you enjoyed the app! Now exiting...'
    update_data('books', @book_data)
    update_data('rental', @rental_data)
    update_data('people', @student_data)
    update_data('people', @teach_data)
    exit
  end

  def options
    option = gets.chomp.to_i
    case option
    when 1
      list_books
      show_books
    when 2
      list_people
      show_people
    when 3
      add_people
    when 4
      add_book
    when 5
      add_rental
    when 6
      show_rental
    else
      exit_app
    end
  end
end
