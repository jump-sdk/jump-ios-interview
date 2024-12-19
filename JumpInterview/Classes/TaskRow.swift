import SwiftUI

struct TaskRow: View {
    let task: Task
    let taskManager: TaskManagerModel

    var body: some View {
        HStack {
            Text("\(task.title) - Due: \(Int(task.dueDate.timeIntervalSince1970))")

            Toggle("", isOn: Binding(
                get: { task.isCompleted },
                set: { _ in
                    taskManager.markTaskCompleted(id: task.id)
                }
            ))
        }
        .onChange(of: task.title) { _ in
            let _ = taskManager.searchTasks(query: task.title)
        }
    }
}
