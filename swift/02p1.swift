var boxIds: [String] = [];
while let boxId = readLine() { boxIds.append(boxId) }

let targetFreqs = [2, 3]
var count: [Int: Int] = [:]
for f in targetFreqs { count[f] = 0 }

for boxId in boxIds {
  var charFreqs: [Character: Int] = [:]

#if swift(>=4.0)
  let idChars = boxId
#elseif swift(>=3.0)
  let idChars = boxId.characters
#endif

  for c in idChars { charFreqs[c] = (charFreqs[c] ?? 0) + 1 }

  var found: [Int: Bool] = [:]
  for f in targetFreqs { found[f] = false }
  for (_, val) in charFreqs {
    if targetFreqs.contains(val) { found[val] = true }

    var allFound = true
    for (_, val) in found { allFound = allFound && val }
    if allFound { break }
  }

  for (key, val) in found {
    if val { count[key] = (count[key] ?? 0) + 1 }
  }
}

var checksum = 1
for (_, val) in count { checksum *= val }
print("\(checksum)")
