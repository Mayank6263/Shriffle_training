class Librarian < User
  def initialize(email, password)
    @email = email
    @password = password
    @type = 'Librarian'
  end

end