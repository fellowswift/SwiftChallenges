/*:

## Challenge 2: **Minesweeper**


Have you ever played Minesweeper? This cute little game comes with a certain operating system whose name we can't remember. The goal of the game is to find where all the mines are located within a M x N field.

The game shows a number in a square which tells you how many mines there are adjacent to that square. Each square has at most eight adjacent squares. The 4 x 4 field on the left contains two mines, each represented by a '*' character. If we represent the same field by the hint numbers described above, we end up with the field on the right:

    *...
    ....
    .*..
    ....

    *100
    2210
    1*10
    1110

## Input

The input will consist in a couple of integers n and m (0 < n, m <= 100) which stand for the number of lines and columns of the field, respectively. Followed by a matrix which contains exactly the characters representing the field.

Safe squares are denoted by "." and mine squares by "*", both without the quotes.

## Output

A matrix replacing all the "." characters by the number of mines adjacent to that square.
*/


func challenge_0002(n: Int, _ m: Int, _ field:[[String]]) -> [[String]] {
    
    <#Write here your solution#>
    
}

// MARK: Checks


/*
let result_1 = challenge_0002(4, 4, [
["*", ".", ".", "."],
[".", ".", ".", "."],
[".", "*", ".", "."],
[".", ".", ".", "."]])

assert(result_1[0] == ["*", "1", "0", "0"])
assert(result_1[1] == ["2", "2", "1", "0"])
assert(result_1[2] == ["1", "*", "1", "0"])
assert(result_1[3] == ["1", "1", "1", "0"])





let result_2 = challenge_0002(3, 5, [
["*", "*", ".", ".", "."],
[".", ".", ".", ".", "."],
[".", "*", ".", ".", "."]])

assert(result_2[0] == ["*", "*", "1", "0", "0"])
assert(result_2[1] == ["3", "3", "2", "0", "0"])
assert(result_2[2] == ["1", "*", "1", "0", "0"])
*/

/*:
This problem appeared originally in programming-challenges.com
*/
