//
//  TaskDetailsRouter.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskDetailsRouter: TaskDetailsRouterProtocol {
    
    func close() {
        AppRouter.hidePresentedVC()
    }
    
    func showTaskEditor(task: Task) {
        let taskEditorVC = TaskEditorTableViewController.create()
        taskEditorVC.task = task
        AppRouter.presentVC(taskEditorVC, animated: true)
    }
}
