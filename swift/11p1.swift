let serialNumStr = readLine()!
let serialNumber = Int(serialNumStr) ?? 0
let gridWidth = 300
let powerWidth = 3

var cells = Array(repeating: Array(repeating: 0, count: gridWidth),
                  count: gridWidth)
for y in 0..<cells.count {
  for x in 0..<cells[y].count {
    let rackId = x + 1 + 10
    cells[y][x] = (((rackId * (y + 1) + serialNumber) * rackId) / 100) % 10 - 5
  }
}

var powers = Array(repeating: Array(repeating: 0, count: gridWidth - powerWidth),
                   count: gridWidth - powerWidth)
var maxPower = 0
var maxPowerX = 0
var maxPowerY = 0
for y in 0..<powers.count {
  for x in 0..<powers[y].count {
    for dy in 0..<powerWidth {
      for dx in 0..<powerWidth {
        powers[y][x] += cells[y + dy][x + dx]
      }
    }
    if powers[y][x] > maxPower {
      maxPower = powers[y][x]
      maxPowerX = x
      maxPowerY = y
    }
  }
}
print("\(maxPowerX + 1),\(maxPowerY + 1)")
