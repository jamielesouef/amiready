import Foundation

protocol UserRepositoryNotificationDelegate: AnyObject {
  func repositoryHasUpdated()
}

class UserRepository {
  private(set) var users: Users = []
  let fetcher: Fetcher

  weak var delegate: UserRepositoryNotificationDelegate?

  init(fetcher: Fetcher = Fetcher()) {
    self.fetcher = fetcher
    let url = URL(string: "http://localhost:3000/users")!
    self.fetcher
      .get(from: url)
      .compactMap { $0["response"]["users"].array }
      .map { Users.from(json: $0) }
      .done { [weak self] users in
        self?.users = users
        self?.delegate?.repositoryHasUpdated()
      }.catch {
        print("we had a boo boo", $0)
    }
  }
}
