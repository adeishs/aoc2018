func getCommonCharStr(boxId1: String, boxId2: String) -> String {
  var commonCharStr = ""
  var diff = 0

  for i in boxId1.characters.indices {
    if boxId1[i] == boxId2[i] {
      commonCharStr += String(boxId1[i])
    } else {
      diff += 1
    }
  }
  if diff == 1 {
    return commonCharStr
  }
  return ""
}

func getCorrectBoxCommonCharStr(_: [String]) -> String {
  let boxCount = boxIds.count
  let jMax = boxCount - 1
  let iMax = jMax - 1
  for i in (0 ... iMax) {
    for j in (i + 1 ... jMax) {

      let str = getCommonCharStr(boxId1: boxIds[i], boxId2: boxIds[j])
      if str != "" {
        return str
      }
    }
  }
  return ""
}

var boxIds: [String] = [];
while let boxId = readLine() {
  boxIds.append(boxId)
}

let boxCount = boxIds.count
let str = getCorrectBoxCommonCharStr(boxIds)
print("\(str)")
