


# 			OOPs

# => 				getter setter(manual),freeze


=begin
class A
	def initialize(a,b)
		@a = a
		@b = b
	end
	def geta
		puts @a
	end
	def getb
		puts @b
	end

	def seta=(a)
		@a = a
	end

	def setb=(b)
		@b = b
	end
end
ins = A.new(1,2)
ins.geta
ins.getb
ins.seta = 11
ins.setb = 12
ins.geta
ins.getb

ins.freeze #cannt modify after freeze method 

# ins.seta = 1123
# ins.setb = 333
# ins.geta
# ins.getb
=end

# => 				ATTRIBUTE ACCESSOR

=begin
class A
	# attr_reader :fname ,:lname
	# attr_writer :fname,:lname
	attr_accessor :fname,:lname #replacess both reader and writer

	def initialize(fname,lname)
		@fname = fname
		@lname = lname
	end
end
a = A.new("mayank","solanki")
p a.fname
p a.lname
a.fname = "ashish"
p a.fname
=end

#-----------------=     Encapsulation

=begin
class Parent
	def initialize(a,b)
		@a = a
		@b = b
	end
	puts "inside parent"
	def disp
		puts "i am parents disp"
		puts "I am from Parents class #{@a},#{@b}"
		# return @a,@b
	end
end
p1 = Parent.new(1,2)
p1.disp
=end

#                        Inheritance


# => 					Single-Inheritance

=begin
class Parent
	def initialize(a,b)
		@a = a
		@b = b
	end
	puts "inside parent"
	def disp
		puts "i am parents disp"
		puts "I am from Parents class #{@a},#{@b}"
	end
end
#p1 = Parent.new(1,2)
#p1.disp


class Child < Parent
	puts "inside child"
	def initialize(a,b)
		#child does not directly calls parents instances so we will use super()
		super(a,b)
	end
	def disp
		puts "i am childs dispch"
		puts "I am from Child class #{@a},#{@b}"
	end
end
child = Child.new(4,5)
child.disp
=end

# => 						MULTI-LEVEL
=begin
class Parent
	def initialize(a,b)
		@a = a
		@b = b
	end
	puts "inside parent"
	def disp
		puts "i am parents disp"
		puts "I am from Parents class #{@a},#{@b}"
		# return @a,@b
	end
end



class Child < Parent
	puts "inside child"
	def initialize(a,b)
		#child does not directly calls parents instances so we will use super()
		super(a,b)
		#without super we will get a,b are not defined
	end
	def disp
		puts "i am Parent dispch"
		puts "I am from Child class #{@a},#{@b}"
	end
end



class GrandChild < Child
	puts "inside GrandChild"
	def initialize(a,b)
		#child does not directly calls parents instances so we will use super()
		super(a,b)
	end
	def disp
		puts "i am grandchilds dispch"
		puts "I am from GrandChild class #{@a},#{@b}"
	end
end

gc = GrandChild.new(3,2)
gc.disp

=end




# => 							Hybrid & Hierarchical Inheritance
=begin
class Parent
	def initialize(a,b)
		@a = a
		@b = b
	end
	puts "inside parent"
	def disp
		puts "i am parents disp"
		puts "I am from Parents class #{@a},#{@b}"
	end
end


class Child1 < Parent
	def initialize(a,b)
		super
	puts "inside Child1"
	end
	def disp
		puts "i am Child1 disp"
		puts "I am from Child1 class #{@a},#{@b}"
	end
end
# c1 = Child1.new(1,2)
# c1.disp

class Child2 < Parent
	def initialize(a,b)
		super(a,b)
	puts "inside Child2"
	end
	def disp
		puts "i am Child2 disp"
		puts "I am from Child2 class #{@a},#{@b}"
	end
end
c2 = Child2.new(3,4)
c2.disp

class Child3 < Parent
	def initialize(a,b)
		super
	puts "inside Child3"
	end
	def disp
		puts "i am Child3 disp"
		puts "I am from Child3 class #{@a},#{@b}"
	end
end
# c3 = Child3.new(5,6)
# c3.disp
=end



# => 			MULTIPLE INHERITANCE 
# it is not supported by ruby but we can acheive via mixin and modules

module A
	def geta
		puts "using geta from module A"
	end
end
module B
	def getb
		puts "using getb from module B"
	end
end

class C
	include A
	include B
	def getc
		puts "I am class c"
	end
end

c = C.new
c.geta




# => 					Polymorphism
# => 									OVERRIDING :-	 
# methods are using in many forms like level for unmarried and married coup


# => 				NORMAL OVERRIDING WITHOUT ARGUMENT

=begin	
class A
	def s
		puts "s method one"
	end
	def s
		puts "s method two"
	end
	def s
		puts "s method three"
	end
end

a = A.new
a.s

=end

# => 			OVERRIDING WITH ARGUMENT

=begin
class Hotel
	puts "Customer Enters "
	def level(customer)
		customer.level
	end

	def price(customer)
		customer.price
	end
end
class Married
	def level
		puts "This person is Married "
		puts "The floor is on 4th"
	end
	def price
		puts "The Rent of floor is 7000"
	end
end

class Unmarried
	def level
		puts "This person is Un-Married "
		puts "The floor is on 2nd"
	end
	def price
		puts "The Rent of floor is 5000"
	end
end

hotel = Hotel.new
married = Married.new
hotel.level(married)
hotel.price(married)

unmarried = Unmarried.new
hotel.level(unmarried)
hotel.price(unmarried)
=end


# => 						Overriding Using Super
=begin
class P
	def pr
		puts "parents method"
	end
end

class C < P
	def pr
		super
		puts "child's methods"
	end
end
c = C.new
c.pr
=end


# => 						OVERLOADING 
# is not supported in ruby but we can acheive it by the following SOLUTION.
# => 			PROBLEM -:
=begin
class C
	def self.sum(a,b,c=0)
		puts "sum(a,b)"
		puts a+b
	end
	def self.sum(a,b,c) #this method overrides the previos method because it has more num of arguments
		puts "sum(a,b,c)"
		puts a+b+c
	end
end

C.sum(1,2)#argument arr :wrong num of arguments
C.sum(1,2,4)
=end


# => 		SOLUTION :-
=begin
class C
	def self.sum(a,b,c=0)
		if c === 0
			puts a+b
		else
			puts a+b+c
		end
	end
end
C.sum(1,2)
C.sum(1,2,3)
=end
# => 	







#----------------        Access Controlls

#                       I. PUBLIC
#accessible to all classes and BY DEFAULT 
#NOTE:- initialize itself uses PRIVAE ACCESS CONTROLL Even though it looks like public


#                       II. PRIVATE
=begin
class A
	def initialize(a,b)
		@a,@b = a,b
	end

	def c
		getab
	end
	private
	def getab
		puts @a,@b
	end
end
privt = A.new(1,2)
privt.c
=end




# => 					III. PROTECTED
# => 		can be called using two instances but private cannot be called by this
=begin
class A
	def initialize(a,b)
		@a = a
		@b = b
	end

	def getm(other)
		puts "public getmethod to use protected #{other.getprotect}"
	end

	protected
	def getprotect
		puts "protected method #{@a},#{@b}"
	end
end

a = A.new(1,2)
b = A.new(2,3)
a.getm(b)
=end


=begin
class Animal < ApplicationController
	def name
		puts "Lion"
	end
end

class Dog < Animal
	def name
		puts "Dog"
	end
end

class Tiger < Animal
	def age
		12
	end
end

Tiger.new.name
module A
  class Head
    EMAIL = "test@yopmail.com
    def self.sds
    end
  end
end
def


email {"test@yopmail.com"}
def mthd
  EMAIL                 

A::Head.sds
Head::DATA
=end