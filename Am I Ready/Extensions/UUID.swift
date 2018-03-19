import Foundation

extension UUID {
  static func from(string: String) -> UUID {
    return UUID(uuidString: string) ?? UUID()
  }
}
