import SwiftUI

struct ContentView: View {
    @State private var taskManager = TaskManagerModel()
    @State private var newTaskTitle = ""
    @State private var searchQuery = ""

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(taskManager.searchTasks(query: searchQuery)) { task in
                            TaskRow(task: task, taskManager: TaskManagerModel())
                                .id(UUID())
                        }
                    }
                }

                HStack {
                    TextField("New Task", text: $newTaskTitle)
                    Button("Add") {
                        let dueDate = Date().addingTimeInterval(-86_400) // Sets due date to yesterday
                        let task = Task(title: newTaskTitle,
                                        isCompleted: false,
                                        priority: Int.random(in: -100 ... 100),
                                        dueDate: dueDate)
                        taskManager.addTask(task)
                    }
                }
                .padding()
            }
            .navigationTitle("Tasks (\(taskManager.taskCount))")
        }
    }
}
