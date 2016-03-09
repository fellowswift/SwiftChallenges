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

enum MineSweeperSolverException: ErrorType {
  case NoMineThere
  case IncorrectMineBounds
}

struct MineSweeperSolver {
  
  let mine: [String]
  let rows: Int
  let columns: Int
  
  init?(rows: Int, columns: Int, mine: [[String]]) {
    // Checking preconditions
    precondition(0 < rows)
    precondition(columns <= 100)
    
    do {
      self.rows    = rows
      self.columns = columns
      self.mine    = try MineSweeperSolver.loadMineSweeper(rows, columns: columns, mine: mine)
    } catch {
      print(error)
      return nil
    }
  }

  // Simpler array management
  subscript(row: Int, column: Int) -> String {
    get {
      return mine[row * columns + column]
    }
  }
  
  static func loadMineSweeper(rows: Int, columns: Int, mine: [[String]]) throws -> [String] {
    do{
      if !(mine.count == rows || mine.map({  $0.count == columns }).contains(false)) {
        // Mine dimensions ain't right
        throw MineSweeperSolverException.IncorrectMineBounds
      }
      
      return mine.reduce([], combine: +)
    } catch {
      throw error
    }
  }

  // Check for "within-bounds" possible positions (Upper Left, Upper, Upper Right ...)
  func checkForPossiblePostions(row r: Int, column c: Int) -> [(Int, Int)] {
    return [(r-1, c-1), (r-1, c), (r-1, c+1), (r, c-1), (r, c+1), (r+1, c-1), (r+1, c), (r+1, c+1)].filter {
      (let pos: (row: Int, column: Int)) -> Bool in
      
      return pos.0 >= 0 && pos.0 < self.rows && pos.1 >= 0 && pos.1 < self.columns
    }
  }

  // Checks mines inside into adjoining positions
  func checkMineForPosition(row: Int, column: Int) -> Int {
    return checkForPossiblePostions(row: row, column: column).reduce(0) {
      (var sum: Int, position: (row: Int, column: Int)) -> Int in
      
      if (self[position.row, position.column] == "*") { sum += 1 }
      
      return sum
    }
  }

  // Let's do some iterations !!
  func solveMinesweeper() -> [[String]] {
    var result: [[String]] = []
    
    (0..<self.rows).forEach { row in
      var tmpRow: [String] = []
      (0..<self.columns).forEach { column in
        let count = self[row, column] != "*" ? String(checkMineForPosition(row, column: column)) : "*"
        tmpRow.append(count)
      }
      result.append(tmpRow)
    }
    
    return result
  }
}

func challenge_0002(n: Int, _ m: Int, _ field:[[String]]) -> [[String]] {
  return MineSweeperSolver.init(rows: n, columns: m, mine: field)!.solveMinesweeper()
}

// MARK: Checks


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
/*:
This problem appeared originally in programming-challenges.com
*/
