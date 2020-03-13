//
//  TaskDetailsProtocols.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

protocol TaskDetailsViewProtocol: class {
    
}

protocol TaskDetailsPresenterProtocol: class {
    func editEction()
    func deleteAction()
    func deleteTaskSuccess()
}

protocol TaskDetailsInteractorProtocol: class {
    var task: Task { get set }
    func deleteTask()
}

protocol TaskDetailsRouterProtocol: class {
    func showTaskEditor(task: Task)
    func close()
}
