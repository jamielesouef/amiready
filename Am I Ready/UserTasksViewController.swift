import UIKit
import RxSwift

class UserTaskViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var viewModel: UserTaskViewModel?

  let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel?
      .asObservable
      .subscribe { [weak self] event in
        switch event {
        case .next: self?.tableView.reloadData()
        case .completed: break
        case .error(let err): print("error \(err)")
        }
      }
      .disposed(by: disposeBag)
  }
}

extension UserTaskViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.taskCount ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = getCell(forTableView: tableView, indexPath: indexPath) else {
      return UITableViewCell()
    }

    cell.configure(with: viewModel?.modelFor(indexPath: indexPath))
    return cell
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerCellIdentifier = R.reuseIdentifier.taskHeaderCell.identifier
    let headerCell = tableView.dequeueReusableCell(withIdentifier: headerCellIdentifier) as? TaskHeaderCell
    if let model = viewModel {
      let headerViewModel = TaskHeaderCellViewModel(title: model.user.displayName,
                                                    remaining: model.remainingTasks,
                                                    total: model.taskCount)
      headerCell?.configure(with: headerViewModel)
    }

    return headerCell
  }

  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return nil
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 88
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    viewModel?.didSelectTask(atIndexPath: indexPath)
  }
}

private extension UserTaskViewController {
  func getCell(forTableView tableView: UITableView, indexPath: IndexPath) -> TaskCell? {
    let taskCellIdentifier = R.reuseIdentifier.taskCell.identifier
    return tableView.dequeueReusableCell(withIdentifier: taskCellIdentifier, for: indexPath) as? TaskCell
  }
}
