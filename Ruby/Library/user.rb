# require_relative "book"
# require_relative "require"
# require_relative 'user'

class User
  def main
    create_demo_user_data
    value = welcome

    case value
    when 1 # New Student
      Student.create
      Student.menu
    when 2 # New Librarian
      Librarian.create
      Librarian.menu
    when 3 # Existing librarian
      3.times do |x|
        x = Librarian.existing_librarian
        puts x
        if x.nil?
          puts "Invalid Mail and Password".upcase.center(100,"-")
          puts ""
          # existing_librarian
        else
          Librarian.menu
          break
        end
      end
      User.new.main
    when 4 # Existing student
      3.times do |x|
        x = Student.existing_student
        if x.nil?
          puts "Invalid Mail and Password\n".center(100,"-").upcase
          # existing_student
        else
          Student.menu
          break
        end
      end
      User.new.main
      # Student.menu
    when 5
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

  protected
  def welcome
    # User Authorization
    puts "Welcome to Library".center(100,'-')
    puts "
      1.Sign up as a Student?
      2.Sign up as a Librarian?
      3.Login as a Librarian?
      4.Login as a Student?
      5.Exit?"

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