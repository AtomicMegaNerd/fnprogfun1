-- A powerful aspect of higher order functions is currying

addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

-- This is called a partially applied function
-- We are using currying!  This returns a function
-- that takes two args, x and y, and adds them
-- to 3.
addTwoNumbersTo3 :: (Num a) => a -> a -> a
addTwoNumbersTo3 x y = addThree x y 3

-- A more concise way to write the above
addTwoNumbersTo3' :: (Num a) => a -> a -> a
addTwoNumbersTo3' = addThree 3

doubleMe :: (Num a) => a -> a
doubleMe x = x * 2

addOne :: (Num a) => a -> a
addOne x = x + 1

times3 :: (Num a) => a -> a
times3 x = x * 3

-- A chain of functions...
crazy :: (Num a) => a -> a
crazy x = (doubleMe (addOne (times3 x)))

-- Remember f(g(h(x))) == f . g . h (x)
-- this works in Haskell.  Currying in action!
crazy' :: (Num a) => a -> a
crazy' = doubleMe . addOne . times3

main = do
	let v1 = addThree 2 3 4
	putStr "v1 = "
	print v1
	
	let v2 = addTwoNumbersTo3' 2 4
	putStr "v2 = "
	print v2
	
	let cr1 = crazy' 5
	putStr "crazy 5 = "
	print cr1
	

