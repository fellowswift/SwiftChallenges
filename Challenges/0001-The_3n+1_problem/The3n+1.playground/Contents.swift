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


func challenge_0001(i: Int, _ j: Int) -> Int {
  
/*:

  Just in case...

*/
  
  precondition( 0 < i)
  precondition( i < j)
  precondition( j < 1_000_000)
  
/*:

  Wouldn't be great something like...
  precondition( 0 < i < j < 1_000_000)

*/
  
  var currentNumber = i
  
/*:

  This is the returned value

*/
  
  var maxLengthCycle = 0
  
/*:

  Saves [number: count of the series for that number 'til 1]
  Ex: challenge(1, 10) -> [1: 0, 2: 1, 4: 2]
  If I found a number here it means it's a repeated cycle and I can't stop looking forward

*/
  
  var duples: [Int: Int] = [:]
  
/*:

  Current requirements for next value

*/

  let nextNumberInCycle: (Int) -> Int = { number -> Int in
    if number % 2 == 0 {
      return number / 2
    } else {
      return (number * 3) + 1
    }
  }
  
  mainLoop: repeat {
    
    var cycle: [Int] = [currentNumber]
    var cycleNumber = currentNumber
    
    repeat {
      if var sum = duples[cycleNumber] { // repeted cycle found
        maxLengthCycle = [maxLengthCycle, cycle.count + sum].maxElement()!
        
/*:

        Fulfilling the whole cycle into duples

*/
        
        cycle.reverse().forEach {
          duples[$0] = sum
          sum += 1
        }
        
/*:

        Neeeeext !!

*/
        
        currentNumber += 1
        continue mainLoop
      }
      
      cycleNumber = nextNumberInCycle(cycleNumber)
      cycle.append(cycleNumber)
      
    } while cycleNumber > 1
    
/*:
    
    Looking for a winner
    
*/
    
    maxLengthCycle = [maxLengthCycle, cycle.count].maxElement()!

/*:

    Cycles to duples

*/

    for (index, val) in cycle.enumerate() {
      duples[val] = cycle.count - (index + 1)
    }
    
    currentNumber += 1
  } while currentNumber <= j
  
  return maxLengthCycle
  
}

//assert(challenge_0001(1, 10) == 20)
//assert(challenge_0001(100, 200) == 125)
//assert(challenge_0001(201, 210) == 89)
//assert(challenge_0001(900, 1000) == 174)
