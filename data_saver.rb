require 'json'

module DataSaver
  def save_book(book)
    File.write('./data_stored/books.json', JSON.pretty_generate(book))
  end

  def load_books
    if File.exist?('./data_stored/books.json')
      listbooks = File.open('./data_stored/books.json')
      info = listbooks.read
      JSON.parse(info)
    else
      File.write('./data_stored/books.json', [])
    end
  end

  def save_person(person)
    File.write('./data_stored/person.json', JSON.pretty_generate(person))
  end

  def load_people
    if File.exist?('./data_stored/person.json')
      listpeople = File.open('./data_stored/person.json')
      info = listpeople.read
      JSON.parse(info)
    else
      File.write('./data_stored/person.json', [])
    end
  end

  def save_rental(rentals)
    File.write('./data_stored/rentals.json', JSON.pretty_generate(rentals))
  end

  def load_rentals
    if File.exist?('./data_stored/rentals.json')
      listrentals = File.open('./data_stored/rentals.json')
      info = listrentals.read
      JSON.parse(info)
    else
      File.write('./data_stored/rentals.json', [])
    end
  end
end
