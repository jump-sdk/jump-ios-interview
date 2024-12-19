import Foundation

struct Task: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    var priority: Int
    var dueDate: Date

    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id.uuidString.lowercased() == rhs.id.uuidString
    }
}
