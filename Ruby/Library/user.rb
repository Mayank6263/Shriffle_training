require_relative "book"
require_relative 'student'
require_relative 'librarian'

class User
  def self.student_search
    puts "You are Searching book"
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Back."
    way = gets.chomp.gsub(/\D/, '').to_i
    if way == 1
      puts "title way"
      Book.search_book_title
      Student.menu
    elsif way == 2
      puts "Author way"
      Book.search_book_author
      Student.menu
    else
      puts "back"
      Student.menu
    end
  end

  def self.librarian_search
    puts "search book"
    puts "You are Searching book"
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Back."
    way = gets.chomp.gsub(/\D/, '').to_i
    if way == 1
      puts "title way"
      Book.search_book_title
      User.librarian_initialprompt_task
    elsif way == 2
      puts "Author way"
      Book.search_book_author
      User.librarian_initialprompt_task

    else
      puts "back"
      User.librarian_initialprompt_task
    end
  end

  def self.create_book_user
    print "Book Title :- "
    title = gets.chomp
    print "Book Author :- "
    author = gets.chomp
    Book.create_book(title,author)
    # puts "Total books in library are #{$books}"
    puts "press Enter key to continue"
    b  = gets.chomp
    User.librarian_initialprompt_task if (b)
  end

  def self.update_book_prompt
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Both(Title & Author).
    4. Back."
    way = gets.chomp.to_i
    if way == 1
      puts "Search By title"
      puts "Old title :- "
      inp = gets.chomp
      exist_title = $books.find{|x| x[:title] == inp}
      # print "please enter new title to update book"
      # title = gets.chomp.to_i
      if exist_title
        print "New Title :- "
        title = gets.chomp
        exist_title[:title] = title
      elsif
        puts "No any title present"
      end
    elsif way == 2
      puts "Search by Author"
      print "Old Author :- "
      inp = gets.chomp
      exist_author = $books.find{|x| x[:author] == inp}
      # print "please enter new title to update book"
      # title = gets.chomp.to_i
      if exist_author
        print "New Author :- "
        author = gets.chomp
        exist_author[:author] = author
      else
        puts "no any book present by that title or author"
      end
    elsif way == 3
      puts "Search By any of them"
      puts "Old title and Author :- "
      inp = gets.chomp
      exist_book = $books.find{|x| x[:title] == inp || x[:author] == inp}

      if exist_book
        print "New title :- "
        title = gets.chomp
        exist_book[:title] = title
        print "New Author :- "
        author = gets.chomp
        exist_book[:author] = author
      else
        puts "no any book present by that title or author"
      end
    elsif way ==4
      User.librarian_initialprompt_task
    else 
      puts "enter digits between 1-4"
    end
  end

  def self.deletebook_user
    # puts "Total books in library are #{$books}"
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Back."
    way = gets.chomp.gsub(/\D/,"").to_i
    if way == 1
      puts "Search By title"
      puts "title :- "
      inp = gets.chomp
      exist_title = $books.find{|x| x[:title] == inp}
      puts exist_title
      if exist_title
        $books.delete(exist_title)
        puts "press any key to continue"
        b  = gets.chomp
        User.librarian_initialprompt_task if (b)
      elsif
        puts "No any title present"
      end
    elsif way == 2
      puts "Search by Author"
      print "Search Author :- "
      inp = gets.chomp
      exist_author = $books.find{|x| x[:author] == inp}
      puts exist_author
      if exist_author
        $books.delete(exist_author)
        puts "press any key to continue"
        b  = gets.chomp
        User.librarian_initialprompt_task if (b)
      else
        puts "no any author present"
        User.librarian_initialprompt_task
      end
    elsif way ==3
      User.librarian_initialprompt_task
    end
  end

  def self.librarian_initialprompt_task
    puts "Logged in as Librarian 
    1. Create Book.
    2. Search Book.
    3. All books.
    4. Update book.
    5. Delete Book.
    6. Log-Out.
    7. Exit."

    b = gets.chomp.gsub(/\D/, '').to_i
    if b == 1
      puts "you entered Create book"
      User.create_book_user
    elsif b == 2
      User.librarian_search
      User.librarian_initialprompt_task
    elsif b == 3
      puts "you entered Show books"
      Book.all_books
      User.librarian_initialprompt_task
    elsif b == 4
      User.update_book_prompt
      User.librarian_initialprompt_task
    elsif b == 5
      puts "you entered Delete book"
      User.deletebook_user
    elsif b == 6
      puts "you entered Log-Out"
      User.main
    else
      return "you entered exit"
      exit
    end
  end

  def self.librarian_task
    puts "Select Task to Perform as Librarian:-
    1. Create Book.
    2. Delete Book.
    3. Back.
    4. Log-Out.
    5. Exit."
    b = gets.chomp.gsub(/\D/, '').to_i
    if b == 1
      puts "you entered Create book"
      User.create_book_user
    elsif b == 2
      puts "you entered Delete book"
      User.deletebook_user
    elsif b == 3
      puts "you entered Back"
      User.librarian_initialprompt_task
    elsif b == 4
      puts "you entered Log-Out"
      User.main 
    else
      return "you entered exit"
      exit
    end
  end

    def self.existing_librarian
    # Authenticating user
    print "mail :- "
    e = gets.chomp
    print "password :- "
    pass = gets.chomp
    user = $users.find {|x| x[:email] == e && x[:password] == pass && x[:type] == "Librarian"}    
    if !user
      puts "Enter correct mail and password"
      User.existing_librarian
    end
  end

  def self.existing_student
    puts "existing student"
    # Authenticating user
    print "mail :- "
    e = gets.chomp
    print "password :- "
    pass = gets.chomp
    user = $users.find {|x| x[:email] == e && x[:password] == pass && x[:type] == "Student"}
    if !user
      puts "Enter correct mail and password"
      User.existing_librarian
    end    # exit
  end

  def self.main
    create_demo_user_data
    value = welcome

    case value
    when 1 # New Student
      Student.create
      Student.menu
    when 2 # New Librarian
      Librarian.new_librarian
      User.librarian_initialprompt_task
    when 3 # Existing librarian
      User.existing_librarian
      User.librarian_initialprompt_task
    when 4 # Existing student
      User.existing_student
      Student.menu
    else
      puts "please enter correct digit"
      User.main
    end
  end

  def save
    $users << {email: @email, password: @password, type: @type}
  end

  private

  def welcome
    # User Authorization
    puts "Welcome to Library
    1.Sign up as a Student?
    2.Sign up as a Librarian?
    3.Login as a Librarian?
    4.Login as a Student?
    5.Exit?"

    input = gets.chomp.gsub(/\D/, '').to_i
    puts "You entered #{input}"
    input
  end

  def create_demo_user_data
    Student.new('mayank','password').save
    Student.new('test_student','test_password').save
    Librarian.new('test_librarian','test_password').save
  end
end
