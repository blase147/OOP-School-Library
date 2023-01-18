class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    book.rental_data.push(self)
    @person = person
    person.rental_data.push(self)
  end
end
