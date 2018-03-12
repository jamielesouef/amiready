import Foundation
import SwiftyJSON

typealias Users = [User]

extension Array where Element == User {
  static func from(json:[JSON]) -> Users {
    return json.map { User(json: $0) }
  }
}

struct User: Codable {
  let id: UUID
  let name: String
  var key: String {
    return DateUtils.getDateString() + "-" + self.name
  }
}


extension User {

  init(json: JSON) {
    self.init(id: json["id"].stringValue, name: json["name"].stringValue)
  }

  init(name: String) {
    id = UUID()
    self.name = name
  }

  init(id: String, name: String) {
    self.id = UUID(uuidString: id) ?? UUID()
    self.name = name
  }
}



