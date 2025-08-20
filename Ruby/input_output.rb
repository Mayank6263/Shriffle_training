
# => INPUT/OUTPUT classes and methods

# file = File.open("one.text","w+")

# p file.read
# file.syswrite(gets.chomp)
# file.rewind
# p file.read

# file_open = File.open("one.text","r")



# => 		Why ENUMERATORS over flow-controlls(loop) 
# nm = "aa"
arr = ["bb","cc"]
# for nm in arr
# 	puts nm
# end
# puts "name is changed to #{nm}"

# arr.map {|nm| puts nm}
# puts "name is changed to #{nm}"

# => 	X ---> RUN IT IN CONSOLE 

# it = arr.each
# it.next #0th index value and so on till lenght-1
# it.next # at n-1th index return end of iteration


#INTERNAl iteration
# p (1..10).count{|x| x%3 == 0}

# External Iteration
# arr = [0,2,2,3,1,2,6].select
# p arr.each_with_index{|val,ind| val == ind}



arr.each {|v,i| puts v,i}