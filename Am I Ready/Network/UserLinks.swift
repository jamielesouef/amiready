import Foundation
import SwiftyJSON
struct UserLinks {
  let resource: URL
  let tasks: URL
}

extension UserLinks {
  init?(json: JSON) {
    guard let resource = URL(string:json["_self"].stringValue),
          let tasks = URL(string: json["tasks"].stringValue) else {
      return nil
    }
    self.tasks = tasks
    self.resource = resource
  }
}
