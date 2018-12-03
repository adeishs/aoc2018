import Foundation

func getSingleClaimId (patches: [[[Int]]], claimIds: [Int]) -> Int {
  var ids = Set(claimIds)
  for row in patches {
    for c in row {
      if c.count > 1 {
        for claimId in c { ids.remove(claimId) }
      }
    }
  }
  return ids.removeFirst()
}

var claims: [String] = [];
while let claim = readLine() { claims.append(claim) }

let ints: [Int] = []
var patches = Array(repeating: Array(repeating: ints, count: 1000),
                    count: 1000)
var claimIds: [Int] = []
for claim in claims {
  var claimEls = claim.components(separatedBy: " @ ")
  claimEls[0].removeFirst(1)
  let claimId = Int(claimEls[0]) ?? 0
  claimIds.append(claimId)
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
    for x in startX..<endX { patches[y][x].append(claimId) }
  }
}

let claimId = getSingleClaimId(patches: patches, claimIds: claimIds)
print("\(claimId)")
