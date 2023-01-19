class Rental
  attr_reader :book, :person
  attr_accessor :date

  def initialize(date, person, book)
    @date = date
    @book = book
    book.rental_data.push(self)
    @person = person
    person.rental_data.push(self)
  end
end
