//
//  Task.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

struct Task: BaseModel {
    
    var id: Int?
    var dueBy: Date?
    var title: String?
    var priority: Priority?
    
    static func getTaskList(success: @escaping ([Task]) -> (), failure: @escaping (Error)->()) {
        NetworkService.shared().makeRequest(path: Path.tasks, method: .get, params: nil, success: { response in
            if let response = response["tasks"] as? Array<[String: Any]> {
                var taskList = [Task]()
                _ = response.map {
                    if let task = Task(JSON: $0) {
                        taskList.append(task)
                    }
                }
                success(taskList)
            }
        }) { error in
            failure(error)
        }
    }
    
    static func fetchTask(id: Int, success: @escaping (Task)->(), failure: @escaping (Error) -> ()) {
        NetworkService.shared().makeRequest(path: Path.tasks + "/\(id)", method: .get, params: nil, success: { response in
            if let responseTask = response["task"] as? [String: Any], let task = Task(JSON: responseTask) {
                success(task)
            }
        }) { error in
            failure(error)
        }
    }
    
    func deleteTask(success: @escaping ()->(), failure: @escaping (Error) -> ()) {
        NetworkService.shared().makeRequest(path: Path.tasks + "/\(id!)", method: .delete, params: nil, success: { _ in
            success()
        }) { error in
            failure(error)
        }
        
    }
    
    static func createTask(task: Task, success: @escaping (Task)->(), failure: @escaping (Error) -> ()) {
        NetworkService.shared().makeRequest(path: Path.tasks, method: .post, params: task.toJSON(), success: { response in
            if let responseTask = response["task"] as? [String: Any], let task = Task(JSON: responseTask) {
                success(task)
            }
        }) { error in
            failure(error)
        }
    }
    
    func updateTask(success: @escaping ()->(), failure: @escaping (Error) -> ()) {
        NetworkService.shared().makeRequest(path: Path.tasks + "/\(id!)", method: .put, params: toJSON(), success: { response in
            success()
        }) { error in
            failure(error)
        }
    }

}

extension Task {
    
    enum Priority: String, Codable, CaseIterable {

        case low = "Low"
        case high = "High"
        case normal = "Normal"

    }
    
    enum Path {
        static let tasks = "/tasks"
    }
    
}
