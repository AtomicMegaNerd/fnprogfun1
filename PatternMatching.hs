import Data.List

-- Lists in Haskell, the following two statements are equivalent
unsorted = [32, 19, 12, 42, 86, 19, 31, 54, 9, 77]
unsorted' = 32 : 19 : 12 : 42 : 86 : 19 : 31 : 54 : 9 : 77 : []

-- This function uses pattern matching.  There are two patterns
-- here that it matches against.  The empty list, or a list
-- containing a head and a tail
listsAreFun :: Show a => [a] -> [Char]
listsAreFun [] = "Empty list"
listsAreFun (x:xs) = "Head == " ++ show x ++ ", tail == " ++ show xs

-- An empty list.. we give it a type so we can
-- pass it to listsAreFun
el :: [Char]
el = []

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
	
	let lf1 = listsAreFun unsorted'
	let lf2 = listsAreFun el -- Empty list
	
	print lf1
	print lf2
	
