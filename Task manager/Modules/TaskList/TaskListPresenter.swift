//
//  TaskListPresenter.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit
import Foundation

class TaskListPresenter: TaskListPresenterProtocol {

    //MARK: - Properties
    
    weak var view:      TaskListViewProtocol!
    var interactor:     TaskListInteractorProtocol!
    var router:         TaskListRouterProtocol!
    
    //MARK: - Confifure
    
    init(_ view: TaskListTableViewController) {
        self.view           = view
        self.router         = TaskListRouter()
        self.interactor     = TaskListInteractor(self)
    }
    
    //MARK: - TaskListPresenterProtocol Methods
    
    func setTasks(data: [Task]) {
        view.updateTableView(data: data)
    }
    
    func filterAction() {}
    
    func addTaskAction() {
        router.showCreateTaskView()
    }
    
    func updateTaskList() {
        interactor.fetchTasksList()
    }
    
    func tapTaskAction(index: Int) {
        interactor.fetchTask(index: index)
    }

    func successFetchTaskDetails(task: Task) {
        router.showTaskDetailView(task: task)
    }
}


