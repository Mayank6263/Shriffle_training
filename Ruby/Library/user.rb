# require_relative "book"
# require_relative "loader"
# require_relative 'user'

class User
  def main
    create_demo_user_data
    value = welcome

    case value
    when 1 # New Student
      sign_up
    when 2 # New Librarian
      sign_in
    # when 3 # Existing librarian
    #   Librarian.existing_librarian
    #   User.new.main
    # when 4 # Existing student
    #   3.times do |x|
    #     x = Student.existing_student
    #     if x.nil?
    #       puts "Invalid Mail and Password\n".center(100,"-").upcase
    #       # existing_student
    #     else
    #       Student.menu
    #       break
    #     end
    #   end
    #   User.new.main
    #   # Student.menu
    when 3
      puts "You entered Exit See you soon"
      exit
    else
      puts "please enter correct digit between 1-4"
      User.new.main
    end
  end

  def save
    $users << {email: @email, password: @password, type: @type}
  end

  def sign_in
    print "Enter Mail :- "
    email = gets.chomp
    print "Enter Password :- "
    password = gets.chomp
    user = $users.find {|x| x[:email] == email && x[:password] == password}
    if user.nil?
      puts "Invalid Credentials"
      sign_in
    else
      Student.menu
    end
  end

  def sign_up
    print "Enter Mail :- "
    email = gets.chomp
    print "Enter Password :- "
    password = gets.chomp
    print "Student/Librarian ? :- "
    type = gets.chomp

    if type == "Student"
      Student.new(email,password).save
      Student.menu
    elsif type == "Librarian"
      Librarian.new(email,password).save
      Librarian.menu
    else
      puts "Select between Student and Librarian Only."
      sign_up
    end
  end

  protected
  def welcome
    # User Authorization
    puts "Welcome to Library".center(100,'-')
    puts "
      1.Sign up
      2.Sign In
      3.Exit?"

    input = gets.chomp.gsub(/\D/, '').to_i
    # puts "You entered #{input}"
    input
  end

  def create_demo_user_data
    Student.new('mayank','password').save
    Student.new('test_student','test_password').save
    Librarian.new('test_librarian','test_password').save
  end

end


require_relative 'student'
require_relative 'librarian'