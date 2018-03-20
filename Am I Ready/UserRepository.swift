import Foundation
import RxSwift
import RxSwiftExt


class UserRepository {

  private(set) var users = BehaviorSubject<Users>(value: [])

  let fetcher: FetcherInjectable
  let disposeBag = DisposeBag()

  init(fetcher: FetcherInjectable = Fetcher()) {
    self.fetcher = fetcher
    self.fetchUsersFromRemoteResource()
  }

  func fetchUsersFromRemoteResource(callback: OptionalCallback = nil) {
    let url = URL(string: "http://localhost:3000/users")!
    self.fetcher
      .get(from: url, callback: callback)
      .map { $0["response"]["users"].arrayValue }
      .map { Users.from(json: $0) }
      .bind(to: users)
      .disposed(by: disposeBag)
  }
}
