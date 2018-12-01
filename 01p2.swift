var sum = 0;
var second = 0;
var ds: [Int] = [];
var seenFreq: [Int: Bool] = [:]
var secondFound = false;
while let dStr = readLine() {
  let d: Int = Int(dStr)!
  ds.append(d)
}
while !secondFound {
  for d in ds {
    sum += d
    if let f = seenFreq[sum] {
      second = sum
      secondFound = true
      break
    } else {
      seenFreq[sum] = true
    }
  }
}
print("\(second)")
