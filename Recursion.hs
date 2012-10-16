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

