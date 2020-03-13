//
//  TaskDetailsPresenter.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskDetailsPresenter: TaskDetailsPresenterProtocol {


    //MARK: - Properties
    
    weak var view:      TaskDetailsViewProtocol!
    var interactor:     TaskDetailsInteractorProtocol!
    var router:         TaskDetailsRouterProtocol!
    
    //MARK: - Confifure
    
    init(_ view: TaskDetailsTableViewController, task: Task) {
        
        self.view           = view
        self.router         = TaskDetailsRouter()
        self.interactor     = TaskDetailsInteractor(self, task: task)
        
    }
    
    //MARK: - TaskDetailsPresenterProtocol
    
    func editEction() {
        router.showTaskEditor(task: interactor.task)
    }
    
    func deleteAction() {
        interactor.deleteTask()
    }
    
    func deleteTaskSuccess() {
        router.close()
    }

}
