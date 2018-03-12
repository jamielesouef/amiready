import Foundation
import SwiftyJSON
import Alamofire
import PromiseKit

class Networking {
  static let manager: SessionManager = {
    let serverTrustPolicies: [String: ServerTrustPolicy] = [
      "localhost:4000": .disableEvaluation
    ]

    let configuration = URLSessionConfiguration.default
    configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders

    return Alamofire.SessionManager(configuration: configuration,
      serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
  }()
}

class Fetcher {
  func get(from url: URL) -> Promise<JSON> {
      return Promise { seal in
        Networking.manager.request(url, method: .get)
          .validate()
          .responseJSON { response in
            switch response.result {
            case .success(let value):
              let json = JSON(value)
              seal.fulfill(json)
            case .failure:
              seal.reject(response.error!)
            }
        }
      }
    }
}
