//
//  TaskListRouter.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskListRouter: TaskListRouterProtocol {
    
    
    func showTaskDetailView(task: Task) {
        let taskDetailsVC = TaskDetailsTableViewController.create()
        taskDetailsVC.task = task
        AppRouter.presentVC(taskDetailsVC, animated: true)
    }
        
    func showCreateTaskView() {
        let vc = TaskEditorTableViewController.create()
        AppRouter.presentVC(vc, animated: true)
    }

}
