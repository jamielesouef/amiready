import UIKit
import RxSwift
import RxCocoa

class UserSelectViewController: UIViewController {

  let repository = UserRepository()
  let disposeBag = DisposeBag()
  var refreshController = UIRefreshControl()
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationTitleIcon()
    setupPullToRefresh()
    setupCollectionViewBinding()
  }

  @objc func refresh(sender: UIRefreshControl) {
    repository.fetchUsersFromRemoteResource { [weak self] in
      self?.refreshController.endRefreshing()
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

  func setupCollectionViewBinding() {
    collectionView.rx.setDelegate(self).disposed(by: disposeBag)

    let identifier = R.reuseIdentifier.userSelectCell.identifier
    repository
      .users
      .bind(to: collectionView.rx.items(cellIdentifier: identifier, cellType: UserSelectCell.self)) { row, element, cell in
        cell.configure(with: element)
      }
      .disposed(by: disposeBag)

  }

  func setupNavigationTitleIcon() {
    let navIcon = UIImage(named: "NavIcon")
    let imageView = UIImageView(image: navIcon)
    imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView
  }

  func setupPullToRefresh() {
    refreshController.attributedTitle = NSAttributedString(string: "Reload users")
    refreshController.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
    collectionView.alwaysBounceVertical = true
    collectionView.refreshControl = refreshController
  }

  func presentTasks(forUser user: User) {
    performSegue(withIdentifier: R.segue.userSelectViewController.toTasks.identifier, sender: user)
  }
}

extension UserSelectViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 3)
  }
}

extension UserSelectViewController: UserSelectCellDelegate {
  func didSelect(user model: User?) {
    guard let model = model else { return }
    presentTasks(forUser: model)
  }
}

