import Foundation
import SwiftyJSON

typealias Users = [User]

struct User {
  let id: UUID
  let name: String
  let links: UserLinks?
  var key: String {
    return DateUtils.getDateString() + "-" + self.name
  }
}

extension User {
  init(json: JSON) {
    id = UUID.from(string:json["id"].stringValue)
    name = json["name"].stringValue
    self.links = UserLinks(json: json["_links"])
  }
}



