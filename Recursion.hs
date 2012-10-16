-- Recursion is very popular in Functional Programming
-- because you can solve many problems without using
-- mutable state

-- Factorial
factorial :: (Eq a, Num a) => a -> a
factorial 1 = 1
factorial x = x * factorial (x - 1)

-- Fibonacci
fibonacci :: (Eq a, Num a) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Given an amount of money, and a list of coin denominations,
-- how many ways can you break down the change to make the specified amount?
countChange :: Int -> [Int] -> Int
countChange money coins
	| money == 0 = 1
	| money < 0 || null coins = 0 -- the null function here checks for an empty list
	| otherwise = countChange money (tail coins) + countChange (money - head coins) coins
	
-- Non pure section of program
-- side effects are allowed here!
main = do
	let v1 = factorial 5
	putStr"5! = " 
	print v1
	
	-- Get the first 10 fibonacci numbers
	let fibs = take 10 $ map fibonacci [1..]
	putStr "The first 10 numbers in the fib seq = " 
	print fibs
	
	let v2 = countChange 100 [1, 5, 10, 25, 50]
	putStr "Number of ways you can divide 100 with units [1, 5, 10, 25, 50] = "
	print v2
	