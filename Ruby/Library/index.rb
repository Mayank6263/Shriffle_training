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
# $data = [$users]
$books = [{:title=>"innovation",:author=>"innovator"},{:title=>"discipline",:author=>"discipline"},]
$book_allot = [{}]

class User
    def self.student_task
      puts "Logged in as Student 
        1. Show all Books 
        2. Enrol book
        3. Deposit book
        4. Log Out"
        b = gets.chomp.to_i
        if b == 1
          puts $books
        elsif b == 2
          Book.collect_books("title")
        end
      end

      def self.enroll_task
        puts "Select Book to enroll
              1. Enroll
              2. Deposit
              3. Logged"
              i = gets.chomp.to_i
              if i == 1
                print "enter title:-"
                title = gets.chomp
                Book.collect_books(title)
                puts $book_allot
              elsif i == 2
                puts "deposit task"
              end
      end
  def self.menu
    create_demo_user_data
  # # authorizing user
  puts "Welcome to Library
    1.Sign up as a Student?
    2.Sign up as a Librarian?
    3.Login as a Libraian?
    4.Login as a Student?
    5.Exit?
    "
    i = gets.chomp.to_i
    puts "you entered #{i}"
    #New Student
    if (i==1)
      puts "You are a new student"
      print "please enter email :- "
        # Authenticating user
      e = gets.chomp
      print "please enter password :- "
      pass = gets.chomp
      puts e,pass
      s = Student.new(e,pass)
      s.save
      User.student_task
      User.enroll_task

    #New Librarian
    elsif i==2
      puts "You are a new librarian"
      print "please enter email :- "
        # Authenticating user
      e = gets.chomp
      print "please enter password :- "
      pass = gets.chomp
      puts e,pass
      l = Librarian.new(e,pass)
      l.save
      puts "Logged in as Librarian 
        1. Create book
        2. Delete book
        3. Show books
        4. exit"
      b = gets.chomp.to_i
      if b == 1
        puts "you entered #{b}"
        print "Book Title :- "
        title = gets.chomp
        print "Book Author :- "
        author = gets.chomp
        Book.create_book(title,author)
        p $books
      elsif b == 2
        puts "You entered #{b}"
      elsif b == 3
        Book.all_books
      else
        return "you entered exit"
      end


      #Existing librarian
    elsif i==3
      puts "existing librarian"
       # Authenticating user
      print "mail :- "
      e = gets.chomp
      print "password :- "
      pass = gets.chomp
       user = $users.find {|x| x[:email] == e && x[:password] == pass && x[:type] == "Librarian"}
        
        puts "no match found please enter correct pass and email" if !user
        # exit
        puts "Logged in as Librarian 
        1. Create book
        2. Delete book
        3. Show books
        4. Log out"
        b = gets.chomp.to_i
        if b == 1
          puts "you entered #{b}"
          print "Book Title :- "
          title = gets.chomp
          print "Book Author :- "
          author = gets.chomp
          Book.create_book(title,author)
          p $books
        elsif b == 2
          puts "You entered #{b}"
        elsif b == 3
          puts Book.all_books
        else
          return "you entered exit"
        end
     
    
    


      #Existing student
    elsif i==4
      puts "existing student"
      # Authenticating user
      print "mail :- "
      e = gets.chomp
      print "password :- "
      pass = gets.chomp
       user = $users.find {|x| x[:email] == e && x[:password] == pass && x[:type] == "Student"}
        puts "no match found please enter correct pass and email" if !user
        # exit
        puts "Logged in as Student 
        1. Show all Books 
        2. Enrol book
        3. Deposit book
        4. Log Out"
        b = gets.chomp.to_i
        if b == 1
          puts $books
        elsif b == 2
          Book.collect_books("title")
        end

    else
      puts "please enter correct digit"
      exit
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

  def self.collect_books(title)
   a = $books.find {|x| x[:title]== title} 
    $book_allot << a
   $books.delete(a)
    puts "alloted books are #{$book_allot} and created books are #{$books}"
  end
   
  # create_book("biography","apj kalam")
  #   create_book("gravity","Newton")
  #   create_book("e = mc^2","Einstein")
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






User.menu
p $users
puts "Exit from terminal"

