import UIKit

class UserSelectViewController: UIViewController {

  let repository = UserRepository()

  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    repository.delegate = self
    setupNavigationTitleIcon()
    setupPullToRefresh()
  }

  @objc func refresh(sender: UIRefreshControl) {
    repository.loadUsers {
      sender.endRefreshing()
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)

    guard let user = sender as? User,
          let controller = segue.destination as? UserTaskViewController else {
      return
    }

    controller.viewModel = UserTaskViewModel(withUser: user)

  }
}

private extension UserSelectViewController {

  func setupNavigationTitleIcon() {
    let navIcon = UIImage(named: "NavIcon")
    let imageView = UIImageView(image: navIcon)
    imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
  }

  func setupPullToRefresh() {
    let refreshControl = UIRefreshControl(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 50))
    refreshControl.attributedTitle = NSAttributedString(string: "Reload users")
    refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    collectionView.alwaysBounceVertical = true
    collectionView.refreshControl = refreshControl
  }

  func presentTasks(forUser user: User) {
    performSegue(withIdentifier: R.segue.userSelectViewController.toTasks.identifier, sender: user)
  }
}

extension UserSelectViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return repository.users.count
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/3)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let identifier = R.reuseIdentifier.userSelectCell.identifier
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? UserSelectCell else {
      return UICollectionViewCell()
    }

    cell.configure(with: repository.users[indexPath.row])
    cell.delegate = self
    return cell
  }
}

extension UserSelectViewController: UserRepositoryNotificationDelegate {
  func repositoryHasUpdated() {
    self.collectionView.reloadData()
  }
}

extension UserSelectViewController: UserSelectCellDelegate {
  func didSelect(user model: User?) {
    guard let model = model else { return }
    presentTasks(forUser: model)
  }
}

