class Library
	attr_reader :books

	def initialize (lib_file = false)
		@lib_file = lib_file
		@books = @lib_file ? YAML::load(File.read(@lib_file)) : []
	end

	def get_books_in_category(category)
		@books.select { |book| book.category == category}
	end

	def add_book(book)
		@books << book
	end

	def get_book(book_title)
		@books.find {|book| book.title == book_title}
	end

	def save(lib_file = false)
		 @lib_file = lib_file || @lib_file || "library.yml"
        File.open @lib_file, "w" do |f|
        	f.write YAML::dump @books
		end
	end


end