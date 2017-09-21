import UIKit


class TasksViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  lazy var viewModel: TasksViewModel = {
    let model = TasksViewModel()
    return model
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Tasks"
    tableView.delegate = viewModel
    tableView.dataSource = viewModel
  }
}
