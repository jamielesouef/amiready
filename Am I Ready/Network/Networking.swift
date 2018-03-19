import Foundation
import Alamofire

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
