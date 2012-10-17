-- This is an exampe of imutability

x = [1, 2, 3] -- This is a list
y = [4, 5, 6] -- This is another list

-- x = x ++ y -- This will not compile

z = x ++ y -- This makes a new list that contains all the elements from x and y

-- Pure function, x and y are immutable
-- so for given values for x and y adder will
-- ALWAYS return the same value!
adder x y = x + y

adder' x y = x + y
--	where x = 3 -- this will not compile

-- This is the special part of the program where IO and side effects
-- are allowed.
main = do
  print z -- print the list, IO has side effects
  
  print (adder 3 4)

