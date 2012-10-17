-- This is an exampe of imutability

x = [1, 2, 3] -- This is a list
y = [4, 5, 6] -- This is another list

-- x = x ++ y -- This will not compile.  Once x is defined we can't change it.

-- We can however concat lists together to create a new list.
z = x ++ y -- This makes a new list that contains all the elements from x and y

-- Pure function, the argyments x and y are immutable
-- so for given inputs x amd y adder will
-- ALWAYS return the same value!  This is guaranteed
-- by the compiler
adder x y = x + y

-- The below code doesn't work
--
-- adder' x y = x + y
--	where x = 3 -- this will not compile, trying to redfine x

-- This is the special part of the program where IO and side effects
-- are allowed.
main = do
  print z -- print the list, IO has side effects
  print (adder 3 4)

