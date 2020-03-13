//
//  TaskEditorProtocols.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

protocol TaskEditorViewProtocol: class {
    func setTask(task: Task)
}

protocol TaskEditorPresenterProtocol: class {
    func saveTask(task: Task)
    func setTask(task: Task)
    func getTask()
    
    func updateTaskSuccess()
    func createTaskSuccess()
}

protocol TaskEditorInteractorProtocol: class {
    func pushTask(task: Task)
    func getTask()
}

protocol TaskEditorRouterProtocol: class {
    func close()
}
