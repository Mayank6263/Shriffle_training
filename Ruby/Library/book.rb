class Book
  def self.delete_book(title)
  end

  def self.create_book(title,author)
    @title = title
    @author = author
    $books << {title: @title, author: @author}
  end

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
  
  def self.search_book_title
    print "Enter title of Book :-"
    search = gets.chomp
    book = $books.find {|x| x[:title] == search}
    if book
    puts "Book you are looking for is "
    book.each {|k,v| puts "#{k}  => #{v}"}
    else
      puts "Book not found"
    end
  end

  def self.search_book_author
    print "Enter Author of Book :-"
    search = gets.chomp
    book = $books.find {|x| x[:author] == search}
    if book
    puts "Book you are looking for is "
    book.each {|k,v| puts "#{k}  => #{v}"}
    else
      puts "Book not found"
    end
  end

  def self.enroll_book
    3.times do |x|
      print "Enter book title to enroll :-"
      title = gets.chomp
      book = $books.find {|x| x[:title]== title}
       
      if book.nil?
        puts "Item not found please enter correct title"
      else
        $book_allot << book
        $books.delete(book)

        puts "Press Enter key to continue" 
        b = gets.chomp
        User.student_task if b
        break
        
      end
    end
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
  User.student_task if b
  end 

end