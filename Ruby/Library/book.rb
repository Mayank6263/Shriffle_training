class Book
  def self.delete_book(title)
    $books.delete($books.find {|x| x[:title]== title} )
  end

  def self.create_book(title,author)
    @title = title
    @author = author
    $books << {title: @title, author: @author}
  end

  # def self.all_books_for_librarian
  #   puts "------------------------------------------"
  #   puts "     ====== #{$books.count} Available Books ======\n"
  #   puts "------------------------------------------"
  #   puts "Sn. Title                             Author\n"
  #   puts "------------------------------------------"
  #   $books.each_with_index { |book, index| puts "#{index+1}- #{book[:title]}                        #{book[:author]}" }
  #   puts "------------------------------------------"
  # end

  def self.all_books
    puts "------------------------------------------"
    puts "     ====== #{$books.count} Available Books ======\n"
    puts "------------------------------------------"
    puts "Sn. Title                             Author\n"
    puts "------------------------------------------"
    $books.each_with_index { |book, index| puts "#{index+1}- #{book[:title]}                        #{book[:author]}" }
    puts "------------------------------------------"
  end

  def self.enrolled_books
    puts "------------------------------------------"
    puts "     ====== #{$book_allot.count} Alloted Books ======\n"
    puts "------------------------------------------"
    puts "Sn. Title                             Author\n"
    puts "------------------------------------------"
    $book_allot.each_with_index { |book, index| puts "#{index+1}- #{book[:title]}                        #{book[:author]}" }
    puts "------------------------------------------"
  end
  
  def self.search_book
    search = gets.chomp
    book = $books.find {|x| x[:title] == search}
    puts "Book you are looking for is "
    puts book.each {|k,v| puts "key => #{k} & value => #{v}"}
  end

  def self.update_book
    title = gets.chomp

  end

  def self.enroll_book
    print "Enter book title to enroll :-"
    title = gets.chomp
    book = $books.find {|x| x[:title]== title}

    if book.nil?
      puts "Item not found please enter correct title"
      self.enroll_book
    end

    $book_allot << book
    $books.delete(book)

    puts "Press Enter key to continue" 
    b = gets.chomp
    User.student_initial_task if b
 end

 def self.deposit_book
  print "Enter book title to deposit :-"
    title = gets.chomp
    book = $book_allot.find {|x| x[:title]== title}

    if book.nil?
      puts "Item not fount please enter correct title"
      self.deposit_book
    end
  $books << book
  $book_allot.delete(book)
  puts "Press Enter key to continue" 
  b = gets.chomp
  User.student_initial_task if b
  end 

  # create_book("biography","apj kalam")
  #   create_book("gravity","Newton")
  #   create_book("e = mc^2","Einstein")
end