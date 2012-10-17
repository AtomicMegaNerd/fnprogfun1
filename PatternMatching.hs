import Data.List

-- Lists in Haskell, the following two statements are equivalent.
-- In fact the first definition is syntactic sugar for the 2nd.
-- We show you this because it helps us to see how pattern
-- matching can break down lists in function definitions.
unsorted = [32, 19, 12, 42, 86, 19, 31, 54, 9, 77]
unsorted' = 32 : 19 : 12 : 42 : 86 : 19 : 31 : 54 : 9 : 77 : []

-- This function uses pattern matching.
listsAreFun :: (Show a) => [a] -> String
listsAreFun [] = "Empty list"
listsAreFun (x:y:z:xs) = "x == " ++ show x ++ ", y == " ++ 
	show y ++ ", z == " ++ show z ++ ", tail == " ++ show xs
listsAreFun (x:y:xs) = "x == " ++ show x ++ ", y == " ++ 
	show y ++ ", tail == " ++ show xs
listsAreFun (x:xs) = "Head == " ++ show x ++ ", tail == " ++ show xs

-- Pattern matching is something we saw before.
-- Here there are three examples of pattern matching
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = [] -- empty list
quicksort (x:xs) = quicksort higher ++ [x] ++ quicksort lower
  where (higher, lower) = partition (<=x) xs -- This where clauses uses pattern matching!

  
main = do
	putStr "Unsorted = "
	print unsorted

	let xhead = head unsorted
	let xtail = tail unsorted
	
	putStr "unsorted head = "
	print xhead
	
	putStr "unsorted tail = "
	print xtail
	
	let sorted = quicksort unsorted
	
	putStr "Sorted = "
	print sorted
	
	let e1 = [] :: [Char]
	let lf1 = listsAreFun unsorted'
	let lf2 = listsAreFun e1
	print lf1
	print lf2
	
