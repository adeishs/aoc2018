func isPair(_ chars: [Character]) -> Bool {
  var isLowercaseChars: [Bool] = []
  var lowercaseChars: [String] = []
  for c in chars {
    let s = String(c)
    isLowercaseChars.append(s.lowercased() == s)
    lowercaseChars.append(s.lowercased())
  }

  return isLowercaseChars[0] != isLowercaseChars[1] &&
         lowercaseChars[0] == lowercaseChars[1]
}

func getProcPolymerLen(_ inputUnits: [Character]) -> Int {
  var prevUnits = inputUnits
  var done = false
  var currUnits: [Character] = []
  while !done {
    let count = prevUnits.count 
    var i = 0
    
    // process polymer
    while i < count {
      if i < count - 1 && isPair([prevUnits[i], prevUnits[i + 1]]) {
        i += 2
        continue
      }
      currUnits.append(prevUnits[i])
      i += 1
    }

    if currUnits.count == count {
      done = true
    } else {
      prevUnits = currUnits
      currUnits = []
    }
  }

  return currUnits.count
}

func removeUnitType(_ inputPolymer: String, _ unitType: Character)
  -> [Character] {
#if swift(>=4.0)
  let inputUnits = Array(inputPolymer)
#elseif swift(>=3.0)
  let inputUnits = Array(inputPolymer.characters)
#endif

  var reducedUnits: [Character] = []
  let lowercasedUnitType = String(unitType).lowercased()
  for i in inputUnits {
    if String(i).lowercased() != lowercasedUnitType { reducedUnits.append(i) }
  }

  return reducedUnits
}

var inputPolymer = ""
while let tmp = readLine() { inputPolymer = tmp }

#if swift(>=4.0)
var minLen = inputPolymer.count
#elseif swift(>=3.0)
var minLen = inputPolymer.characters.count
#endif

let units = Array(UInt8(ascii: "a")...UInt8(ascii: "z")).map {
  Character(UnicodeScalar($0))
}
print("\(units)")
for c in units {
  let len = getProcPolymerLen(removeUnitType(inputPolymer, c))
  if len < minLen { minLen = len }
}
print("\(minLen)")
