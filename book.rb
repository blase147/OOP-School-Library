class Book
  attr_accessor :title, :author, :rental_data

  def initialize(title, author)
    @title = title
    @author = author
    @rental_data = []
  end

  def add_rental_data(date, person)
    Rental.new(date, self, person)
    rental_data.push(self)
  end
end
