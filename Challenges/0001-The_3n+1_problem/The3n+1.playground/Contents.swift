/*: 

## Challenge 1: **The 3n+1 problem**

Consider the following algorithm to generate a sequence of numbers. Start with an integer n. If n is even, divide by 2. If n is odd, multiply by 3 and add 1. Repeat this process with the new value of n, terminating when n = 1. For example, the following sequence of numbers will be generated for n = 22:

22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1

It is conjectured (but not yet proven) that this algorithm will terminate at n = 1 for every integer n. Still, the conjecture holds for all integers up to at least 1,000,000.

For an input n, the cycle-length of n is the number of numbers generated up to and including the 1. In the example above, the cycle length of 22 is 16. Given any two numbers i and j, you are to determine the maximum cycle length over all numbers between i and j, including both endpoints.

## Input
The input will consist in a couple of integers. All of them will be less than 1,000,000 and greater than 0.

## Output
Output the maximum cycle length found in the range defined by the input values i and j.
*/

extension Int {
    func isOdd() -> Bool {
        return self % 2 != 0
    }
}

func getCycleLength(number: Int) -> Int {
    if number == 1 {
        return 1
    }

    if number.isOdd() {
        return 1 + getCycleLength(number * 3 + 1);
    }
    else {
        return 1 + getCycleLength(number / 2);
    }
}

func challenge_0001(var i: Int, var _ j: Int) -> Int {
    
    if i > j { (i, j) = (j, i) }
    
    var maxCycleLength = 0
    for currentNumber in i...j {
        let cycleLength = getCycleLength(currentNumber)
        if cycleLength > maxCycleLength {
            maxCycleLength = cycleLength
        }
    }
    return maxCycleLength
}

assert(challenge_0001(1, 10) == 20)
assert(challenge_0001(10, 1) == 20)
assert(challenge_0001(100, 200) == 125)
assert(challenge_0001(200, 100) == 125)
assert(challenge_0001(201, 210) == 89)
assert(challenge_0001(210, 201) == 89)
assert(challenge_0001(900, 1000) == 174)
assert(challenge_0001(1000, 900) == 174)
