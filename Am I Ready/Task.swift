import Foundation

struct Task: Codable {
  let title: String
  var complete: Bool
}

extension Task {
  init(title: String) {
    self.title = title
    self.complete = false
  }

  func with(status: Bool) -> Task {
    return Task(title: self.title, complete: status)
  }

  func toggleStatus() -> Task {
    return Task(title: self.title, complete: !complete)
  }
}
