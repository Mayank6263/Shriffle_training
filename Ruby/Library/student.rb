require_relative 'user'
require_relative 'book'

class Student < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Student'
  end

  def self.create
    print 'Please enter your email :- '
    email = gets.chomp
    print 'Please enter your password :- '
    password = gets.chomp
    puts email, password
    student = Student.new(email, password)
    student.save
  end

  def self.menu
    puts "Logged in as Student
    1. All Books.
    2. My Books.
    3. Search Book.
    4. Enroll.
    5. Deposit.
    6. Back.
    7. Log-Out.
    8. Exit."
    value = gets.chomp.gsub(/\D/, '').to_i
  # please use when case here 
    if value == 1
      puts "You entered Show Books"
      Book.all_books
      menu
    elsif value == 2
      puts "You entered My Books"
      Book.enrolled_books
      menu
    elsif value == 3
      User.student_search
    elsif value == 4
      Book.enroll_book
    elsif value == 5
      Book.deposit_book
    elsif value == 6
      menu
    elsif value == 7
      User.main
    elsif value == 8
      puts "You entered #{i}. See you soon"
      exit
    else
      puts "Please enter digit between 1-8"
    end
  end
end