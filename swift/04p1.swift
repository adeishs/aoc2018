import Foundation

struct LogEvent {
  var duration = 0
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

  let event = LogEvent(duration: getMinsFromMidnight(time), desc: eventDesc)
  if dailyEntries[date] == nil { dailyEntries[date] = [] } 
  dailyEntries[date]!.append(event)
}

// structure: sleepNumOfMinutes[guardId]
var currentGuardId = 0
var guardSleeping = false
var prevMin = 0
var currMin = 0
var prevDate = ""
var currDate = ""
var numOfDaysFromEpoch = 0
for currDate in Array(dailyEntries.keys).sorted() {
  for event in dailyEntries[currDate] ?? [] {
    if currentGuardId == 0 {
    }
    print("\(currDate): \(event.duration), \(event.desc)")

  }

  // next day?
  if (prevDate != "" && currDate != prevDate) { numOfDaysFromEpoch += 1 }
  prevDate = currDate
}
