import Foundation

struct TaskRepository {
  static let aidan = [
    Task(title: "Lock Windows"),
    Task(title: "Brush Teeth"),
    Task(title: "Make Bed", status: .complete)
  ]

  static let ryan = [
    Task(title: "Brush Teeth"),
    Task(title: "Make Bed"),
    Task(title: "Take medicine")
  ]
}
