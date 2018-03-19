import Foundation
import SwiftyJSON

extension Array where Element == User {
  static func from(json:[JSON]) -> Users {
    return json.map { User(json: $0) }
  }
}
