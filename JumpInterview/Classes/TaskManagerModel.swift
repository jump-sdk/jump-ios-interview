import Foundation

class TaskManagerModel: ObservableObject {
    @Published var tasks: [Task] = []
    var taskCount: Int = 0

    func addTask(_ task: Task) {
        tasks.append(task)
        taskCount += 1
    }

    func markTaskCompleted(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks.remove(at: index)
        }
    }

    func searchTasks(query: String) -> [Task] {
        tasks.filter { task in
            let words = task.title.split(separator: " ")
            return words.contains(where: { $0.lowercased() == query.lowercased() })
        }
    }
}
