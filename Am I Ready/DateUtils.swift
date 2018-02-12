import Foundation

struct DateUtils {
  static func getDateString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    return formatter.string(from: Date())
  }
}
