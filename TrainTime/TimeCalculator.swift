import Foundation

func timeUntil(time: String) -> String {
    let calendar = Calendar.current
    let now = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let currentDateString = dateFormatter.string(from: now)
    
    let dateTimeFormatter = DateFormatter()
    dateTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    let futureDate = dateTimeFormatter.date(from: "\(currentDateString) \(time)")!
    
    let diff = calendar.dateComponents([.hour, .minute, .second], from: now, to: futureDate)
    
    let prettyHour = String(format: "%02d", diff.hour!)
    let prettyMinute = String(format: "%02d", diff.minute!)
    let prettySecond = String(format: "%02d", diff.second!)
    
    return "\(prettyHour):\(prettyMinute):\(prettySecond)"
}

func timeIsInFuture(time: String) -> Bool {
    let now = Date()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let currentDateString = dateFormatter.string(from: now)
    
    let dateTimeFormatter = DateFormatter()
    dateTimeFormatter.dateFormat = "yyyy-MM-dd HH:mm"
    let futureDate = dateTimeFormatter.date(from: "\(currentDateString) \(time)")!
    
    return now < futureDate
}

func nextTrainTime(times: [String]) -> String {
    for time in times {
        if timeIsInFuture(time: time) {
            return time
        }
    }
    
    return "N/A"
}
