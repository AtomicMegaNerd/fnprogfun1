-- Map is commony used in functional languages...
-- map executes a function f on each item in the list argument
-- and returns each result from f as a new list
myMap :: (a -> b) -> [a] -> [b]
myMap f [] = []
myMap f (x:xs) = f x : myMap f xs

-- Filter is also a commonly used function.  It runs a predicate
-- function p on each element of the list argument.  It returns
-- each element that passes the predicate as a new list.
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter p [] = []
myFilter p (x:xs)
	| p x = x : myFilter p xs
	| otherwise = myFilter p xs

-- Return a number doubled
doubleMe :: (Num a) => a -> a
doubleMe x = x * 2

-- Return true if a number is even
isEven :: (Integral a) => a -> Bool
isEven x = x `mod` 2 == 0

main = do
	let l1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	putStr "Our list = "
	print l1
	
	-- List concatenation, expensive, especially for large lists!
	let l1cat = l1 ++ [10, 11, 12]
	print l1cat
	
	-- Appending to the beginning of a list, cheap and fast!
	let l1app = 0 : l1
	print l1app
	
	let l2 = myMap doubleMe l1
	putStr "Run map with doubleMe on our list -> "
	print l2
	
	putStr "All items in the list that are even -> "
	let l3 = myFilter isEven l1
	print l3
	
	