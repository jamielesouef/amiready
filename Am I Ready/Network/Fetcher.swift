import Foundation
import SwiftyJSON
import Alamofire
import RxSwift

protocol FetcherInjectable {
  func get(from url: URL) -> Observable<JSON>
}

class Fetcher:FetcherInjectable {

  enum FetcherErrros: Error {
    case couldNotGetFromResource(error:Error?)
  }

  func get(from url: URL) -> Observable<JSON> {
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
        }
        return Disposables.create()
      }
    }
}
