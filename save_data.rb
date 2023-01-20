require 'json'

module DataSaver
  def get_data(file)
    path_file = "./store_data/#{file}.json"
    File.new(path_file, 'w+') unless File.exist?(path_file)
    File.write(path_file, '[]') if File.empty?(path_file)
    file_contents = File.read(path_file)
    JSON.parse(file_contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json = JSON.generate(data, opts)
    File.write("./store_data/#{file}.json", json)
  end

  def show_books
    get_data('books').map { |item| Book.new(item['title'], item['author']) }
  end

  def show_people
    get_data('people').map do |item|
      if item['class'] == 'teacher'
        Teacher.new(item['specialization'], item['age'], item['name'], id: item['id'])
      else
        Student.new(nil, item['age'], item['name'], parent_permission: item['parent_permission'], id: item['id'])
      end
    end
  end

  def show_rentals
    get_data('rental').map do |rental|
      person = if rental['person']['specialization']
                 Teacher.new(rental['person']['specialization'], rental['person']['age'], rental['person']['name'],
                             id: rental['person']['id'])
               else
                 Student.new(nil, rental['person']['age'], rental['person']['name'],
                             parent_permission: rental['person']['parent_permission'], id: rental['person']['id'])
               end
      book = Book.new(rental['book']['title'], rental['book']['author'])
      Rental.new(rental['date'], person, book)
    end
  end
end
