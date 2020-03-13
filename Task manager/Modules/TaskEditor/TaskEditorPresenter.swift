//
//  TaskEditorPresenter.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskEditorPresenter: TaskEditorPresenterProtocol {

    //MARK: - Properties
    
    weak var view:      TaskEditorViewProtocol!
    var interactor:     TaskEditorInteractorProtocol!
    var router:         TaskEditorRouterProtocol!
    
    //MARK: - Confifure
    
    init(_ view: TaskEditorTableViewController, task: Task?) {
        
        self.view = view
        self.router = TaskEditorRouter()
        self.interactor = TaskEditorInteractor(self, task: task)
        
    }
    
    //MARK: - TaskEditorPresenterProtocol
    
    func saveTask(task: Task) {
        interactor.pushTask(task: task)
    }
    
    func setTask(task: Task) {
        view.setTask(task: task)
    }
    
    func getTask() {
        interactor.getTask()
    }
    
    func createTaskSuccess() {
        router.close()
    }
    
    func updateTaskSuccess() {
        router.close()
    }

}
