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

var inputPolymer = ""
while let tmp = readLine() { inputPolymer = tmp }

#if swift(>=4.0)
var prevUnits = Array(inputPolymer)
#elseif swift(>=3.0)
var prevUnits = Array(inputPolymer.characters)
#endif

var done = false
var currUnits: [Character] = []
while !done {
  var count = prevUnits.count 
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

print("\(currUnits.count)")
