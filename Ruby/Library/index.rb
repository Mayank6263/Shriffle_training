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





require_relative "user.rb"

$users = []
# $data = [$users]
$books = [{:title=>"innovation",:author=>"innovator"},{:title=>"discipline",:author=>"discipline"},]
$book_allot = [{:title=>"demo",:author=>"demo"}]



User.main
