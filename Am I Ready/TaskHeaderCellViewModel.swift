import Foundation

struct TaskHeaderCellViewModel {
  let title: String
  let remaining: String
  let date: String
}

extension TaskHeaderCellViewModel {
  init(title: String, remaining: Int, total: Int) {
    self.title = "\(title) Tasks"

    self.remaining = remaining == 0 ? "Done" : "\(total - remaining)/\(total)"

   self.date = DateUtils.getDateString()
  }
}
