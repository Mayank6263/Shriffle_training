# require_relative "require"
require_relative "book"
require_relative "user"

class Student < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Student'
  end

  def self.create
    puts "<= Sign-Up as Student =>".center(100,"-")
    print 'Email :- '
    email = gets.chomp
    print 'Password :- '
    password = gets.chomp
    if email.empty? || password.empty?
      puts "Credentials Can't be empty, Re-Enter email and password"
      create
    end
    student = Student.new(email, password)
    student.save
  end

  def self.existing_student
    puts "<= Sign-In as Student =>".center(70,'-')
    # Authenticating user
    print "Mail :- "
    email = gets.chomp
    print "Password :- "
    password = gets.chomp
    user = $users.find {|x| x[:email] == email && x[:password] == password && x[:type] == "Student"}
    if user.nil?
      puts "Invalid Credentials. Re-Enter Credentials please"
      existing_student
    elsif user[:email] != email && user[:password] != password
      puts "Invalid Credentials".center(100,'-')
    else      
      menu
    end
  end

  def self.menu
    puts "<= Logged in as Student =>".center(100,"-")
    puts "
    1. All Books.
    2. My Books.
    3. Search Book.
    4. Enroll.
    5. Deposit.
    6. Log-Out.
    7. Exit."
    value = gets.chomp.gsub(/\D/, '').to_i
    case value
    when 1
      Book.all_books
      menu
    when 2
      Book.enrolled_books
      menu
    when 3
      Student.student_search
    when 4
      Book.enroll_book
    when 5
      Book.deposit_book
    when 6
      puts "Successfully Logged-Out".center(100,"-")
      User.new.main
    when 7
      puts "You entered #{value}. See you soon".center(100,'-')
      exit
    else
      puts "Please enter digit between 1-8".center(100,'-')
      menu
    end
  end

  def self.student_search
    puts "<=   Searching Book   =>".center(100,'-')
    puts "which method would you prefer
    1. Title.
    2. Author.
    3. Back."
    way = gets.chomp.gsub(/\D/, '').to_i
    case way
    when 1
      puts "<= Title Method =>".center(100,'-')
      Book.search_book_title
      puts "Press Enter key to continue" 
      b = gets.chomp
      Student.menu if b
    when 2
      puts "<= Author Method =>".center(100,'-')
      Book.search_book_author
      puts "Press Enter key to continue" 
      b = gets.chomp
      Student.menu if b
    else
      puts "back"
      Student.menu
    end
  end
end

