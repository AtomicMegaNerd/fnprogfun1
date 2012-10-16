import Data.List

-- Lists in Haskell, the following two statements are equivalent
unsorted = [32, 19, 12, 42, 86, 19, 31, 54, 9, 77]
unsorted' = 32 : 19 : 12 : 42 : 86 : 19 : 31 : 54 : 9 : 77 : []

xhead = head unsorted
xtail = tail unsorted

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

lf1 = listsAreFun unsorted'
lf2 = listsAreFun el -- Empty list

-- Pattern matching is something we saw before.
-- Here there are three examples of pattern matching
quicksort :: (Ord a) => [a] -> [a]
quicksort [] = [] -- empty list
quicksort (x:xs) = quicksort higher ++ [x] ++ quicksort lower
  where (higher, lower) = partition (<=x) xs -- This where clauses uses pattern matching!

sorted = quicksort unsorted

