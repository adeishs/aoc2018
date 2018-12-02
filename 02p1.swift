var boxIds: [String] = [];
while let boxId = readLine() {
  boxIds.append(boxId)
}

var numOfTwos = 0
var numOfThrees = 0

for boxId in boxIds {
  var charFreqs: [Character: Int] = [:]
  for i in boxId.characters.indices {
    let c: Character = boxId[i]
    if let f = charFreqs[c] {
      charFreqs[c]! += 1
    } else {
      charFreqs[c] = 1
    }
  }

  var twoFound = false
  var threeFound = false
  for (key, val) in charFreqs {
    if val == 2 {
      twoFound = true
    } else if val == 3 {
      threeFound = true
    }
  }

  if twoFound {
    numOfTwos += 1
  }
  if threeFound {
    numOfThrees += 1
  }
}

let checksum = numOfTwos * numOfThrees
print("\(checksum)")
