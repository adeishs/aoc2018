import Foundation

struct LogEvent {
  var minsFromMidnight = 0
  var desc = ""
}

func getMinsFromMidnight(_ timeStr: String) -> Int {
  var timeEls = timeStr.components(separatedBy: ":")
  let hour = Int(timeEls.removeFirst()) ?? 0
  let min = Int(timeEls.removeFirst()) ?? 0
  return 60 * hour + min
}

var entries: [String] = [];
while let entry = readLine() { entries.append(entry) }
entries.sort()

// parse to dailyEntries[date: [events]]
var dailyEntries: [String: [LogEvent]] = [:]
for e in entries {
  var entryEls = e.components(separatedBy: "] ")
  var timestamp = entryEls.removeFirst()
  let eventDesc = entryEls.removeFirst()

#if swift(>=4.0)
  timestamp.removeFirst(1)
#elseif swift(>=3.0)
  timestamp = String(event.characters.dropFirst())
#endif

  var timestampEls = timestamp.components(separatedBy: " ")
  let date = timestampEls.removeFirst()
  let time = timestampEls.removeFirst()

  let event = LogEvent(minsFromMidnight: getMinsFromMidnight(time),
                       desc: eventDesc)
  if dailyEntries[date] == nil { dailyEntries[date] = [] } 
  dailyEntries[date]!.append(event)
}

var guardId = 0
var currMin = 0
// structure: sleepMinFreq[guardId][minute] = freq
var sleepMinFreq: [Int: [Int]] = [:]
let guardSep = CharacterSet.init(charactersIn: " #")
for currDate in Array(dailyEntries.keys).sorted() {
  var sleepStartMin = 0

  for event in dailyEntries[currDate] ?? [] {
    currMin = event.minsFromMidnight

    var els = event.desc.components(separatedBy: " ")
    let eventType = els.removeFirst()
    if eventType == "Guard" || guardId == 0 {
      // format: ‘Guard #<ID> begins shift’
      var els = els[0].components(separatedBy: guardSep)
      els.removeFirst()
      guardId = Int(els.removeFirst()) ?? 0
    } else if eventType == "wakes" {
      if sleepMinFreq[guardId] == nil {
        sleepMinFreq[guardId] = [Int]([])
        for _ in 0..<60 { sleepMinFreq[guardId]!.append(0) }
      }
      for m in sleepStartMin..<currMin {
        sleepMinFreq[guardId]![m] += 1
      }
    } else if eventType == "falls" {
      sleepStartMin = currMin
    }
  }
}

// find the minute the guard sleeps most
var targetGuardId = 0
var targetMinute = 0
var maxFreq = 0
for (guardId, _) in sleepMinFreq {
  for minute in 0..<60 {
    let freq = sleepMinFreq[guardId]![minute]
    if freq > maxFreq {
      maxFreq = freq
      targetGuardId = guardId
      targetMinute = minute
    }
  }
}
let m = targetGuardId * targetMinute
print("\(m)")
