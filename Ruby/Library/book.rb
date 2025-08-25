class Book
  def self.delete_book(title)
    $books.delete(title)
  end

  def self.create_book(title,author)
    @title = title
    @author = author
    $books << {title: @title, author: @author}
  end

  def self.all_books
    puts $books
  end

  def self.collect_books(title,author)
    $book_allot << {title: @title, author: @author}
  end
   
  # create_book("biography","apj kalam")
  #   create_book("gravity","Newton")
  #   create_book("e = mc^2","Einstein")
end