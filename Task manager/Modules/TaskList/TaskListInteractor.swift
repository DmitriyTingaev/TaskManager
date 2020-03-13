//
//  TaskListInteractor.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskListInteractor: TaskListInteractorProtocol {
    
    var myTasks: [Task] = [Task]()
    
    weak var presenter: TaskListPresenterProtocol!
    
    init(_ presenter: TaskListPresenter) {
        self.presenter = presenter
    }
    
    func fetchTasksList() {
        Task.getTaskList(success: { tasks in
            self.myTasks = tasks
            self.presenter.setTasks(data: tasks)
        }) { error in
            AppRouter.presentAlert(error: error)
        }
    }
    
    func fetchTask(index: Int) {
        let id = myTasks[index].id
        Task.fetchTask(id: id!, success: { task in
            self.presenter.successFetchTaskDetails(task: task)
        }) { error in
            AppRouter.presentAlert(error: error)
        }
    }
    
    
    
}


