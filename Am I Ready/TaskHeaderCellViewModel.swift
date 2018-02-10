import Foundation

struct TaskHeaderCellViewModel {
  let title: String
  let remaining: String
  let date: String
}

extension TaskHeaderCellViewModel {
  init(withUser user: Users) {
    self.title = user.displayName
    self.remaining = "\(user.tasks.count)"
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMM d, yyyy"
    self.date = formatter.string(from: Date())
  }
}
