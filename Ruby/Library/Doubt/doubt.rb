# data = [{
#   "email":"librarian1@gmail.com",
#   "password":1234,
#   "catagory":"admin"
# },
# {
#   "email":"Student1@gmail.com",
#   "password":1234,
#   "catagory":"student"
# },
# ]

# # authorizing user
# puts "Welcome to Library
#   0.Are you Libraian?
#   1.Are you Student?"
# i = gets.chomp.to_i
# puts "you entered #{i}"

# #authenticating user
# puts "please enter email and password"
# e = gets.chomp
# pass = gets.chomp.to_i

# if( i == 0 && data[i][:email] == e && data[i][:password] == pass)
#   puts "Welcome #{data[i][:catagory]}
#   1. Add book,
#   2. delete book
#   to add book press 1 or 2 to delete"
# add_delete = gets.chomp.to_i
#   if (add_delete == 1)
#     puts "adding task"
#   elsif(add_delete == 2)
#     puts "deleting task"
#   end
# elsif (i == 1 && data[i][:email] == e && data[i][:password] == pass )
#   puts "Welcome #{data[i][:catagory]}
#   1. Collect book,
#   2. Deposit book
#   to Collect book press 1 or 2 to Deposit"
# add_delete = gets.chomp.to_i
#   if (add_delete == 1)
#     puts "adding task"
#   elsif(add_delete == 2)
#     puts "deleting task"
#   end
# end







$users = []
$books = {}
$book_allot = []




class User
    
  def self.menu
    create_demo_user_data
  # # authorizing user
  puts "Welcome to Library
    0.Sign up as a Student?
    1.Sign up as a Librarian?
    2.Login as a Libraian?
    3.Login as a Student?
    4.Exit?
    "
    i = gets.chomp.to_i
    puts "you entered #{i}"
    if (i==0)
      puts "You are a new student"
      print "please enter email :- "
        # Authenticating user
      e = gets.chomp
      print "please enter password :- "
      pass = gets.chomp.to_i
      puts e,pass
      s = Student.new(e,pass)
      s.save
      puts "Logged in as Student 
        0. Enrol book
        1. Deposit book
        2. exit"
      b = gets.chomp.to_i
    elsif i==1
      puts "You are a new librarian"
      print "please enter email :- "
        # Authenticating user
      e = gets.chomp
      print "please enter password :- "
      pass = gets.chomp.to_i
      puts e,pass
      l = Librarian.new(e,pass)
      l.save
      puts "Logged in as Librarian 
        0. Create book
        1. Delete book
        2. Show books
        2. exit"
      b = gets.chomp.to_i
      if b == 0
        puts "you entered #{b}"
        print "Book Title :- "
        title = gets.chomp
        print "Book Author :- "
        author = gets.chomp
        l.create_book(title,author)
        p $books
      elsif b == 1
        puts "You entered #{b}"
      elsif b == 2
        puts l.all_books
      else
        return "you entered exit"
      end
    elsif i==2
      puts "existing librarian"
       # Authenticating user
      print "mail :- "
      e = gets.chomp
      print "password :- "
      pass = gets.chomp.to_i
      puts e,pass

    elsif i==3
      puts "existing student"
      # Authenticating user
      print "mail :- "
      e = gets.chomp
      print "password :- "
      pass = gets.chomp.to_i
      puts e,pass

    else
      # exit
      return "you entered exit"
    end
  end
  

  def save
    $users << self
  end

  private
  def create_demo_user_data
    Student.new('mayank','password').save
    Student.new('test_student','test_password').save
    Librarian.new('test_librarian','test_password').save
  end
end

class Librarian < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Libraian'
  end

  def create_book(title,author)
    @title = title
    @author = author
    $books["title"]=@title
    $books["author"]=@author    
  end

  def all_books
    puts $books
  end
end

class Student< User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Student'
  end
end

User.menu
p $users
puts "Exit from terminal"

