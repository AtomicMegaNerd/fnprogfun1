-- Recursion is very popular in Functional Programming
-- because you can solve many problems without using
-- mutable state

-- Factorial
factorial :: (Eq a, Num a) => a -> a
factorial 1 = 1
factorial x = x * factorial (x - 1)

-- Fibonacci sequence
fibonacci :: (Eq a, Num a) => a -> a
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- Get the first 10 fibonacci numbers
fibs = take 10 $ map fibonacci [1..]

-- Given an amount of money, and a list of coin denominations,
-- how many ways can you break down the change to make the specified amount?
countChange :: Int -> [Int] -> Int
countChange money coins
	| money == 0 = 1
	| money < 0 || null coins = 0 -- the null function here checks for an empty list
	| otherwise = countChange money (tail coins) + countChange (money - head coins) coins
