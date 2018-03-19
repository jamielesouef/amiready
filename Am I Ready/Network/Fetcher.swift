import Foundation
import SwiftyJSON
import Alamofire
import PromiseKit

protocol FetcherInjectable {
  func get(from url: URL) -> Promise<JSON>
}

class Fetcher:FetcherInjectable {
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
