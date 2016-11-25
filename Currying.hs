-- A powerful aspect of higher order functions is currying
addThree :: (Num a) => a -> a -> a -> a
addThree x y z = x + y + z

-- When you call a function with 3 arguments in Haskell, this is
-- what really happens.  let's call our addThree function:

-- addThree 3 4 5
-- addThree a -> a -> a -> -> a
-- addThree x y z = x + y + z

-- The argument 5 is applied to z and this returns
-- a new function that now takes two arguments
-- f1 a -> a-> -> a
-- f1 x y = x + y + 5

-- The argument 4 is applied to y and this returns
-- a new function that takes one argument
-- f2 a -> a
-- f2 x = x + 4 + 5

-- The argument 3 is applied to x and the function
-- is evalutaed, it returns 12.
-- 3 + 4 + 5
-- 12


-- We can actually assign these intermediate functions
-- to a variable and use them... let's apply 3 to z
-- and return the function to use:
addTwoNumbersTo3 :: (Num a) => a -> a -> a
addTwoNumbersTo3 x y = addThree x y 3

-- A more concise way to write the above
-- due to algebraic simplification...
addTwoNumbersTo3' :: (Num a) => a -> a -> a
addTwoNumbersTo3' = addThree 3

-- Okay, let's try something a little different...
-- Function composition.  Let's define some
-- simple functions...

doubleMe :: (Num a) => a -> a
doubleMe x = x * 2

addOne :: (Num a) => a -> a
addOne x = x + 1

times3 :: (Num a) => a -> a
times3 x = x * 3

-- We can easily chain them together...
crazy :: (Num a) => a -> a
crazy x = (doubleMe (addOne (times3 x)))

-- Remember function compostion?
-- f(g(h(x))) == (f . g . h)(x)
-- Calling f, then g, then h on x is the same
-- as calling the composition of f . g. h on x.
-- This works in Haskell.  Currying in action!
-- This expression returns a function that takes
-- one argument x.  It multiplies x by 3, adds 1
-- to the result, and then doubles the 2nd result.
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


