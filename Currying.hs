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

