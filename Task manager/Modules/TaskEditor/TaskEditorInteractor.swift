//
//  TaskEditorInteractor.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskEditorInteractor: TaskEditorInteractorProtocol {

    var task: Task!
    weak var presenter: TaskEditorPresenterProtocol!
    
    init(_ presenter: TaskEditorPresenter, task: Task?) {
        self.presenter = presenter
        
        if let newTask = task {
            self.task = newTask
        } else {
            self.task = Task()
            self.task.title = nil
            self.task.priority = Task.Priority.low
            self.task.dueBy = Date()
        }
        
    }
    
    func getTask() {
        presenter.setTask(task: self.task)
    }
    
    func pushTask(task: Task) {
        if let _ = task.id {
            updateTask(task: task)
        } else {
            createTask(task: task)
        }
    }
    
    private func updateTask(task: Task) {
        AppRouter.showLoader()
        task.updateTask(success: {
            AppRouter.hideLoader()
            self.presenter.updateTaskSuccess()
        }, failure: { error in
            AppRouter.hideLoader()
            AppRouter.presentAlert(error: error)
        })
    }
    
    private func createTask(task: Task) {
        AppRouter.showLoader()
        Task.createTask(task: task, success: { response in
            AppRouter.hideLoader()
            self.presenter.createTaskSuccess()
        }) { error in
            AppRouter.hideLoader()
            AppRouter.presentAlert(error: error)
        }
    }
    
}
