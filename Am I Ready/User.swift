import Foundation

typealias Users = [User]

struct User {
  let id: UUID
  let name: String
  var key: String {
    return DateUtils.getDateString() + "-" + self.name
  }
}


extension User {
  init(name: String) {
    id = UUID()
    self.name = name
  }

  init(id: String, name: String) {
    self.id = UUID(uuidString: id) ?? UUID()
    self.name = name
  }
}



