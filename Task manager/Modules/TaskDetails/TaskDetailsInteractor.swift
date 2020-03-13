//
//  TaskDetailsInteractor.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskDetailsInteractor: TaskDetailsInteractorProtocol {

    var task: Task
    weak var presenter: TaskDetailsPresenterProtocol!
    
    init(_ presenter: TaskDetailsPresenter, task: Task) {
        self.presenter = presenter
        self.task = task
    }
    
    func deleteTask() {
        AppRouter.showLoader()
        task.deleteTask(success: {
            AppRouter.hideLoader()
            self.presenter.deleteTaskSuccess()
        }) { error in
            AppRouter.hideLoader()
            AppRouter.presentAlert(error: error)
        }
    }
    
}
