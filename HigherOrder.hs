-- Higher order functions mean you can pass functions as parameters
-- Here are two basic functions
addTen x = x + 10
multByTen x = x * 10

-- This function takes a function argument, and calls the function
-- twice on the 2nd argument.
doOperationTwice f x = f (f x)

-- We can pass addTen and multByTen to doOperationTwice as an 
-- argument to create new functions!  
-- These expressions also return a function that we can call!
addTenTwice x = doOperationTwice addTen x
multByTenTwice x = doOperationTwice multByTen x 

-- Calling our higher order functions that were returned to us
x = addTenTwice 3
y = multByTenTwice 3

-- Notice the x on both sides above?  We can use algebraic
-- simplification here... remove it
addTenTwice' = doOperationTwice addTen
multByTenTwice' = doOperationTwice multByTen 

-- Haskell still creates the right function that takes the 
-- argument for us!
x' = addTenTwice' 3
y' = multByTenTwice' 3

main = do
	let v1 = addTen 3
	putStr "Addin 10 to 3 = "
	print v1
	
	-- Pass addTenTwice to map, which will run the function passed
	-- on an argment over each item in the list and return the resultant
	-- list
	let l1 = map addTenTwice' [1, 2, 3, 4, 5]
	print l1