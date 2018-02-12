import Foundation

enum Status {
  case complete, open
}

struct Task: Codable {
  let title: String
  var status: Status
  
  func encode(to encoder: Encoder) throws {
    <#code#>
  }
  
  init(from decoder: Decoder) throws {
    self.task = decoder.
  }
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
