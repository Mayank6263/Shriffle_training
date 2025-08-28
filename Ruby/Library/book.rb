class Book
  def self.create_book(title,author)
    @title = title
    @author = author
    $books << {title: @title, author: @author}
  end

  def self.all_books
    puts ""
    puts " Available Books = #{$books.count} ".center(100,"=")
    puts "".center(100,'-')
    puts "Sn. Title                             Author\n"
    puts "".center(100,'_')
    $books.each_with_index { |book, index| puts "#{index+1}- #{book[:title].center(50)}                        #{book[:author]}" }
    puts ""
  end

  def self.enrolled_books
    puts ""
    puts "#{$book_allot.count} Enrolled Books".center(100,"=")
    puts "".center(100,'-')
    puts "Sn. Title                             Author\n"
    puts "".center(100,'_')
    $book_allot.each_with_index { |book, index| puts "#{index+1}- #{book[:title]}                        #{book[:author]}" }
    puts ""
  end
  
  def self.search_book_title
    3.times do |x|
      print "Title :- "
      search = gets.chomp
      book = $books.find {|x| x[:title] == search}
      if book.nil?
        puts "Book not found"
      else
        puts "Book you are looking for is "

        book.each {|k,v| puts "#{k}  => #{v}"}
        break
      end
    end
  end

  def self.search_book_author
    3.times do |x|
      print "Author :- "
      search = gets.chomp
      book = $books.find {|x| x[:author] == search}
      if book.nil?
        puts "Book not found"
      else
        puts "Book you are looking for is "
        book.each {|k,v| puts "#{k}  => #{v}"}
        break
      end
    end
  end

  def self.enroll_book
    3.times do |x|
      print "Enter book title to enroll :- "
      title = gets.chomp
      book = $books.find {|x| x[:title]== title}
       
      if book.nil?
        puts "Item not found please enter correct title"
      else
        $book_allot << book
        $books.delete(book)
        enrolled_books
        break        
      end
    end
    puts "Press Enter key to go Home".center(100,'-')
    b = gets.chomp
    Student.menu if b
 end

  def self.deposit_book
    3.times do |x|
      print "Enter book title to deposit :- "
      title = gets.chomp
      book = $book_allot.find {|x| x[:title]== title}

      if book.nil?
        puts "Item not fount please enter correct title"
      else
        $books << book
        $book_allot.delete(book)
        all_books
        break
      end
    end 
      puts "Press Enter key to continue".center(100,'-')
      b = gets.chomp
      Student.menu if b
  end
end