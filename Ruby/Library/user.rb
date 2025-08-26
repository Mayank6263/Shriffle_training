require_relative "book"
# require_relative "student-librarian"

class User
  def self.welcome
    # # authorizing user
    puts "Welcome to Library
    1.Sign up as a Student?
    2.Sign up as a Librarian?
    3.Login as a Librarian?
    4.Login as a Student?
    5.Exit?"
    
  end

  def self.student_initial_task
    puts "Logged in as Student
    1. All Books.
    2. Search Book.
    2. My Books.
    3. Log Out.
    4. Exit."
    b = gets.chomp.to_i
    if b == 1
      puts "You entered Show Books"
      Book.all_books
      User.student_task
    elsif b == 2
      puts "You entered My Books"
      Book.enrolled_books
      User.student_task
    elsif b == 3
      puts "You entered Log-Out"
      User.main
    else
      puts "You entered Exit"
      exit
    end
  end

  def self.new_student
    print "please enter email :- "
    # Authenticating user
    e = gets.chomp
    print "please enter password :- "
    pass = gets.chomp
    puts e,pass
    s = Student.new(e,pass)
    s.save
  end

  def self.createbook_user
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

  def self.deletebook_user
    puts "Total books in library are #{$books}"
    print "Book Title :- "
    title = gets.chomp
    Book.delete_book(title)
    # puts "remaining books in library are #{$books}"
    puts "press Enter key to continue"
    b  = gets.chomp
    User.librarian_initialprompt_task if (b)
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
      b = gets.chomp.to_i
      if b == 1
        puts "you entered Create book"
        User.createbook_user
      elsif b == 2
        puts "search book"
        Book.search_book
        User.librarian_initialprompt_task
      elsif b == 3
        puts "you entered Show books"
        Book.all_books
        User.librarian_task
      elsif b == 4
        puts "update books"
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
        b = gets.chomp.to_i
        if b == 1
          puts "you entered Create book"
          User.createbook_user
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

  def self.new_librarian
    print "please enter email :- "
      # Authenticating user
    e = gets.chomp
    print "please enter password :- "
    pass = gets.chomp
    puts e,pass
    l = Librarian.new(e,pass)
    l.save
  end

  def self.student_task
    puts "Select any task
    1. Enroll.
    2. Deposit.
    3. Back.
    4. Log-Out.
    5. Exit."
    i = gets.chomp.to_i
    if i == 1
      Book.enroll_book
    elsif i == 2
      Book.deposit_book
    elsif i == 3
      User.student_initial_task
    elsif i == 4
      User.main
    else
      puts "you entered #{i}. See you soon"
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
    User.welcome
    i = gets.chomp.to_i
    puts "you entered #{i}"
    #New Student
    if (i==1)
      User.new_student
      User.student_initial_task

    #New Librarian
    elsif i==2
      User.new_librarian
      User.librarian_initialprompt_task


    #Existing librarian
    elsif i==3
      User.existing_librarian
      User.librarian_initialprompt_task
    #Existing student
    elsif i==4
      User.existing_student
      User.student_initial_task
    else
      puts "please enter correct digit"
      User.main
    end
  end
  
  def save
    $users << {email: @email, password: @password, type: @type}
  end


  private
  def self.create_demo_user_data
    Student.new('mayank','password').save
    Student.new('test_student','test_password').save
    Librarian.new('test_librarian','test_password').save
  end
end


class Student< User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Student'
  end

end

class Librarian < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Librarian'
  end

end