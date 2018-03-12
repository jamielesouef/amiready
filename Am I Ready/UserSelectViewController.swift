import UIKit

class UserSelectViewController: UIViewController {

  let users: [User] = [
    User(id: "04b21ea6-25b6-11e8-b467-0ed5f89f718b", name: "Aidan"),
    User(id: "2a601ae3-c9e5-4abf-854a-8846fea8f028", name: "Ryan")
  ]

  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let navIcon = UIImage(named: "NavIcon")
    let imageView = UIImageView(image: navIcon)
    imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
    imageView.contentMode = .scaleAspectFit
    navigationItem.titleView = imageView

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
  func presentTasks(forUser user: User) {
    performSegue(withIdentifier: R.segue.userSelectViewController.toTasks.identifier, sender: user)
  }
}

extension UserSelectViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return users.count
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height/2)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    let identifier = R.reuseIdentifier.userSelectCell.identifier
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? UserSelectCell else {
      return UICollectionViewCell()
    }

    cell.configure(with: users[indexPath.row])
    cell.delegate = self
    return cell
  }
}

extension UserSelectViewController: UserSelectCellDelegate {
  func didSelect(user model: User?) {
    print("didSelect:user", model)
    guard let model = model else { return }
    presentTasks(forUser: model)
  }
}

