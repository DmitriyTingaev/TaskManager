//
//  TaskEditorTableViewController.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class TaskEditorTableViewController: UITableViewController {
    
    @IBOutlet weak var titleTextField: CustomTextField!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    
    var task: Task?
    lazy var presenter = TaskEditorPresenter(self, task: task)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        presenter.getTask()
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let _ = task?.id {
            return TaskEditorHeaderView.create(delegate: self)
        } else {
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let _ = task?.id {
            return 72
        } else {
            return 0
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        task!.title = titleTextField.text ?? ""
        task!.dueBy = dueDatePicker.date
        
        switch prioritySegment.selectedSegmentIndex {
        case 0: task!.priority = .low
        case 1: task!.priority = .normal
        case 2: task!.priority = .high
        default: task!.priority = .low
        }
        
        presenter.saveTask(task: task!)
    }
    
}

extension TaskEditorTableViewController: TaskEditorViewProtocol {
    
    func setTask(task: Task) {
        self.task = task
        titleTextField.text = task.title
        dueDatePicker.date = task.dueBy!
        
        switch task.priority {
        case .low: prioritySegment.selectedSegmentIndex = 0
        case .normal: prioritySegment.selectedSegmentIndex = 1
        case .high: prioritySegment.selectedSegmentIndex = 2
        case .none: prioritySegment.selectedSegmentIndex = 0
        }
    }
    
}

extension TaskEditorTableViewController: TaskEditorHeaderViewDelegate {
    
    func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

}
