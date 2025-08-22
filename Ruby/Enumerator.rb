# => 	Enumerator:- enumerator is a class which uses internal and external iteration on collection like arr,hash, which provides flexible way of iteration.



# => 		Why ENUMERATORS over flow-controlls(loop) 
# nm = "aa"
arr = []
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


# => 		EACH VS MAP (console pr chalega sublime pr nhi)
# each returns the original array but
# map returns the array from transformed array
# e = arr.each {|x| x if x%2==0}
# puts e


# m = arr.map {|x| x if x%2==0}
# puts m 

# find returns single matching value to that condition 
# find_all returns all matching value i.e array []

# reverse sort
# arr.sort {|a,b| b <=> a}

# arr = ['a','ab','abc','c']
# arr.sortby{|x| -x.size} # sorting in decreasing order

# arr = [1,2,3,4,5,6]
# n = arr.each_slice(2)


# arr = [1,2,3,4,5,6]
#  [1, 2, 3, 4, 5, 6] 
# arr
#  [1, 2, 3, 4, 5, 6] 

# => 			MAP/COLLECT
# a = arr.map{|x| x if x%2==0 }
#  [nil, 2, nil, 4, nil, 6] 
# a
#  [nil, 2, nil, 4, nil, 6] 

# => 			SELECT/FILTER
# a = arr.select{|x| x if x%2==0 }
#  [2, 4, 6] 
# a = arr.filter{|x| x if x%2==0 }
# [2, 4, 6] 


