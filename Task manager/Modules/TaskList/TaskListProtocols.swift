//
//  TaskListProtocols.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

protocol TaskListViewProtocol: class {
    func updateTableView(data: [Task])
}

protocol TaskListPresenterProtocol: class {
        
    func filterAction()
    func addTaskAction()
    func updateTaskList()
    func tapTaskAction(index: Int)
    func setTasks(data: [Task])
    
    func successFetchTaskDetails(task: Task)
}

protocol TaskListInteractorProtocol: class {
    func fetchTasksList()
    func fetchTask(index: Int)
}

protocol TaskListRouterProtocol: class {
    func showTaskDetailView(task: Task)
    func showCreateTaskView()
}
