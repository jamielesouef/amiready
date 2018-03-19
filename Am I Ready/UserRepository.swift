import Foundation

protocol UserRepositoryNotificationDelegate: AnyObject {
  func repositoryHasUpdated()
}

class UserRepository {
  private(set) var users: Users = [] {
    didSet {
      self.delegate?.repositoryHasUpdated()
    }
  }

  let fetcher: FetcherInjectable

  weak var delegate: UserRepositoryNotificationDelegate?

  init(fetcher: FetcherInjectable = Fetcher()) {
    self.fetcher = fetcher
    self.loadUsers()
  }

  func loadUsers(callback: (() -> Void)? = nil) {
    let url = URL(string: "http://localhost:3000/users")!
    self.fetcher
      .get(from: url)
      .compactMap { $0["response"]["users"].array }
      .map { Users.from(json: $0) }
      .done { [weak self] users in
        self?.users = users
        callback?()
      }.catch {
        print("we had a boo boo", $0)
      }
  }
}
