@testable import JumpInterview
import XCTest

class TaskTests: XCTestCase {
    func testTaskEquality() {
        let id = UUID()
        let task1 = Task(title: "Test", isCompleted: false, priority: 1, dueDate: Date())
        let task2 = Task(title: "Test", isCompleted: false, priority: 1, dueDate: Date())

        XCTAssertEqual(task1, task2)
    }

    func testConcurrentTaskAddition() {
        let taskManager = TaskManagerModel()
        let expectation = XCTestExpectation(description: "Tasks added")

        DispatchQueue.concurrentPerform(iterations: 100) { _ in
            taskManager.addTask(Task(title: "Test",
                                     isCompleted: false,
                                     priority: 1,
                                     dueDate: Date()))
        }

        XCTAssertEqual(taskManager.tasks.count, 100)
        expectation.fulfill()
    }

    func testAsyncTaskSearch() {
        let taskManager = TaskManagerModel()
        taskManager.addTask(Task(title: "Find me",
                                 isCompleted: false,
                                 priority: 1,
                                 dueDate: Date()))

        let results = taskManager.searchTasks(query: "find")
        XCTAssertEqual(results.count, 1)
    }
}
