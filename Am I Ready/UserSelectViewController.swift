import UIKit

class UserButton: UIButton {
  override func awakeFromNib() {
    super.awakeFromNib()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 5
    backgroundColor = UIColor.blue
  }
}

class UserSelectViewController: UIViewController {

  @IBOutlet weak var aidanSelectButton: UserButton!
  @IBOutlet weak var ryanSelectButton: UserButton!


  @IBAction func selectUser(_ sender: UIButton) {
    guard let title = sender.titleLabel?.text else {
      return
    }

    switch title {
    case "Aidan": presentTasks(forUser: .aidan)
    case "Ryan": presentTasks(forUser: .ryan)
    default: return
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)

    guard let user = sender as? Users,
          let controller = segue.destination as? UserTaskViewController else {
      return
    }

    controller.viewModel = UserTaskViewModel(withUser: user)

  }
}

private extension UserSelectViewController {
  func presentTasks(forUser user: Users) {
    performSegue(withIdentifier: R.segue.userSelectViewController.toTasks.identifier, sender: user)
  }
}


