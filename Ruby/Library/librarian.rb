# require_relative 'user'
require_relative 'book'
# require_relative "require"

class Librarian < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Librarian'
  end

  def self.create
    puts "Sign-Up as Librarian".center(100,'-')
    print "Mail :- "
    # Authenticating user
    email = gets.chomp
    print "Password :- "
    password = gets.chomp
    if email.empty? || password.empty?
      puts "Credentials Can't be empty, Re-Enter email and password"
      create
    end
    librarian = Librarian.new(email,password)
    librarian.save
  end

  def self.existing_librarian
    puts "Sign-In as Librarian".center(100,"-")
    # Authenticating user
    print "Mail :- "
    email = gets.chomp
    print "Password :- "
    password = gets.chomp
    user = $users.find {|x| x[:email] == email && x[:password] == password && x[:type] == "Librarian"}    
    if user.nil?
      puts "Invalid Credentials. Re-Enter Credentials please"
      existing_librarian
    elsif user[:email] != email && user[:password] != password
      puts "Invalid Credentials".center(100,'-')
    else      
      menu
    end
  end

  def self.menu
    puts "Logged in as Librarian
    1. Create Book.
    2. Search Book.
    3. All books.
    4. Update book.
    5. Delete Book.
    6. Log-Out.
    7. Exit."

    task = gets.chomp.gsub(/\D/, '').to_i
    case task
    when 1
      Librarian.create_book_user
    when 2
      Librarian.librarian_search
      Librarian.menu
    when 3
      Book.all_books
      Librarian.menu
    when 4
      Librarian.update_book_prompt
      Librarian.menu
    when 5
      puts "<= Delete Book =>".center(100,'-')
      Librarian.deletebook
      Librarian.menu
    when 6
      puts "Successfully Logged Out"
      User.new.main
    when 7
      return "you entered exit"
      exit
    else
      puts "Please enter digit between 1-7"
      Librarian.menu
    end
  end

  def self.create_book_user
    puts "<= Create Book=>".center(100,'-')
    print "Book Title :- "
    title = gets.chomp
    print "Book Author :- "
    author = gets.chomp
    Book.create_book(title,author)
    # puts "Total books in library are #{$books}"
    puts "press Enter key to continue"
    b  = gets.chomp
    Librarian.menu if (b)
  end

  def self.update_book_prompt
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Both(Title & Author).
    4. Back."
    way = gets.chomp.to_i
    if way == 1
      puts "<= Title Method =>".center(100,'-')
      puts "Old title :- "
      inp = gets.chomp
      exist_title = $books.find{|x| x[:title] == inp}
      # print "please enter new title to update book"
      # title = gets.chomp.to_i
      if exist_title
        puts "<= Update Title=>".center(100,'-')
        print "New Title :- "
        title = gets.chomp
        exist_title[:title] = title
      elsif
        puts "No Book Found by that Title"
      end
    elsif way == 2
      puts "<= Author Method =>".center(100,'-')
      print "Old Author :- "
      inp = gets.chomp
      exist_author = $books.find{|x| x[:author] == inp}
      # print "please enter new title to update book"
      # title = gets.chomp.to_i
      if exist_author
        puts "<= Update Author=>".center(100,'-')
        print "New Author :- "
        author = gets.chomp
        exist_author[:author] = author
      else
        puts "No Book Found by that author"
      end
    elsif way == 3
      puts "Search By any of them"
      puts "Old title and Author :- "
      inp = gets.chomp
      exist_book = $books.find{|x| x[:title] == inp || x[:author] == inp}

      if exist_book
        puts "<= Update Title & Author =>".center(100,'-')
        print "New title :- "
        title = gets.chomp
        exist_book[:title] = title
        print "New Author :- "
        author = gets.chomp
        exist_book[:author] = author
      else
        puts "No Book Found by that title or author"
      end
    elsif way ==4
      User.menu
    else 
      puts "Invalid Digits:- Enter digits between 1-4"
    end
  end

  def self.deletebook
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Back."
    way = gets.chomp.gsub(/\D/,"").to_i
    if way == 1
      puts "<= Title Method =>".center(100,'-')
      print "Old Title :- "
      inp = gets.chomp
      exist_title = $books.find{|x| x[:title] == inp}
      puts exist_title
      if exist_title
        $books.delete(exist_title)
        puts "press any key to continue"
        b  = gets.chomp
        Librarian.menu if (b)
      else
        puts "No any Title Found"
      end
    elsif way == 2
      puts "<= Author Method =>".center(100,'-')
      print "Old Author :- "
      inp = gets.chomp
      exist_author = $books.find{|x| x[:author] == inp}
      puts exist_author
      if exist_author
        $books.delete(exist_author)
        puts "Press any key to continue"
        b  = gets.chomp
        Librarian.menu if (b)
      else
        puts "No Author Found"
        Librarian.menu
      end
    elsif way ==3
      Librarian.menu
    end
  end

  def self.librarian_search
    puts "<= Searching =>".center(100,'-')
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Back."
    way = gets.chomp.gsub(/\D/, '').to_i
    if way == 1
      puts "<= Title Method =>".center(100,'-')
      Book.search_book_title
      puts "Press Enter key to continue" 
      b = gets.chomp
      Librarian.menu if b
    elsif way == 2
      puts "<= Author Method =>".center(100,'-')
      Book.search_book_author
      Librarian.menu

    else
      puts "back"
      Librarian.menu
    end
  end
end