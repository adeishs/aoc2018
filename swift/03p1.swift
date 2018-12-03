import Foundation

var claims: [String] = [];
while let claim = readLine() { claims.append(claim) }

var patches = Array(repeating: Array(repeating: 0, count: 1000), count: 1000)
for claim in claims {
  let claimEls = claim.components(separatedBy: " @ ")
  let claimSpec = claimEls[1]
  let specGeoEls = claimSpec.components(separatedBy: ": ")
  let startCoord = specGeoEls[0]
  let area = specGeoEls[1]
  let startCoordEls = startCoord.components(separatedBy: ",")
  let startX = Int(startCoordEls[0]) ?? 0
  let startY = Int(startCoordEls[1]) ?? 0
  let areaEls = area.components(separatedBy: "x")
  let endX = startX + (Int(areaEls[0]) ?? 0)
  let endY = startY + (Int(areaEls[1]) ?? 0)

  for y in startY..<endY {
    for x in startX..<endX { patches[y][x] += 1 }
  }
}

var multipleClaimCount = 0
for row in patches {
  for c in row {
    if c > 1 { multipleClaimCount += 1 }
  }
}
print("\(multipleClaimCount)")
