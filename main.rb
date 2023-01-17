require './app'
require './data_saver'
require 'colorize'
class Main
  include DataSaver
  def main_start
    app = App.new
    loop do
      puts
      app.menu
      option = gets.chomp.to_i
      case option
      when 1
        app.list_all_books
      when 2
        app.list_all_persons
      when 3
        app.create_person
      when 4
        app.create_book
      when 5
        app.create_rental
      when 6
        app.list_all_persons
        app.list_rentals_for_id
      when 7
        puts 'Thank you For using this app!'.cyan
        exit
      end
    end
  end
end

main = Main.new
main.main_start
