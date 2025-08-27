require_relative 'user'

class Librarian < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Librarian'
  end

  def self.create
    print "please enter email :- "
    # Authenticating user
    e = gets.chomp
    print "please enter password :- "
    pass = gets.chomp
    puts e,pass
    librarian = Librarian.new(e,pass)
    librarian.save
  end
end