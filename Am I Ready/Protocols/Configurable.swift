import Foundation

protocol Configurable {
  associatedtype T
  func configure(with model: T?)
}
