import Foundation

enum Status {
  case complete, open
}

struct Task {
  let title: String
  var status: Status
}

extension Task {
  init(title: String) {
    self.title = title
    self.status = .open
  }
  
  func with(status: Status) -> Task {
    return Task(title: self.title, status: status)
  }
  
  func toggleStatus() -> Task {
    let newStatus: Status = status == .open ? .complete : .open
    return Task(title: self.title, status: newStatus)
  }
}
