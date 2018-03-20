import Foundation
import SwiftyJSON
import Alamofire
import RxSwift

typealias OptionalCallback = (() -> Void)?

protocol FetcherInjectable {
  func get(from url: URL, callback: OptionalCallback) -> Observable<JSON>
}

class Fetcher:FetcherInjectable {

  enum FetcherErrros: Error {
    case couldNotGetFromResource(error:Error?)
  }

  func get(from url: URL, callback: OptionalCallback = nil) -> Observable<JSON> {
      return Observable.create { o in
        Networking.manager.request(url, method: .get)
          .validate()
          .responseJSON { response in
            switch response.result {
            case .success(let value):
              let json = JSON(value)
              o.onNext(json)
            case .failure:
              o.onError(Fetcher.FetcherErrros.couldNotGetFromResource(error: response.error))
            }
            callback?()
        }
        return Disposables.create()
      }
    }
}
