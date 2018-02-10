import UIKit

class UserSelectViewController: UIViewController {

  @IBOutlet weak var aidanSelectButton: UIButton!
  @IBOutlet weak var ryanSelectButton: UIButton!


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


