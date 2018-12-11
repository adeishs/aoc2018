let serialNumStr = readLine()!
let serialNumber = Int(serialNumStr) ?? 0
let gridWidth = 300

var cells = Array(repeating: Array(repeating: 0, count: gridWidth),
                  count: gridWidth)
for y in 0..<cells.count {
  for x in 0..<cells[y].count {
    let rackId = x + 1 + 10
    cells[y][x] = (((rackId * (y + 1) + serialNumber) * rackId) / 100) % 10 - 5
  }
}

var maxPower = 0
var maxPowerX = 0
var maxPowerY = 0
var maxPowerWidth = 0
for powerWidth in 1...gridWidth {
  for y in 0...gridWidth - powerWidth {
    for x in 0...gridWidth - powerWidth {
      var power = 0
      for dy in 0..<powerWidth {
        for dx in 0..<powerWidth {
          power += cells[y + dy][x + dx]
        }
      }
      if power > maxPower {
        maxPower = power
        maxPowerX = x
        maxPowerY = y
        maxPowerWidth = powerWidth
      }
    }
  }
}
print("\(maxPowerX + 1),\(maxPowerY + 1),\(maxPowerWidth)")
