//
//  TaskDetailsTableViewController.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class TaskDetailsTableViewController: UITableViewController {
    
    var task: Task!
    var taskColor: UIColor!

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    @IBOutlet weak var deadlineLabel: UILabel!
    
    lazy var presenter = TaskDetailsPresenter(self, task: task)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        switch task.priority {
            
        case .low: taskColor = UIColor(rgb: 0xCCCCCC)
        case .high: taskColor = UIColor(rgb: 0xFFCCCC)
        case .normal: taskColor = UIColor(rgb: 0xD0CCFF)
        case .none: taskColor = UIColor(rgb: 0xCCCCCC)
            
        }
        
        let frame = CGRect(x: view.frame.width - 20, y: 0, width: 20, height: view.frame.height)
        let indicator = UIView(frame: frame)
        indicator.backgroundColor = taskColor
         
        view.addSubview(indicator)
        
        headerLabel.text = task.title
        //deadlineLabel.text = task.deadline
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return TaskDetailsHeaderView.create(priority: task!.priority!.rawValue, color: taskColor, delegate: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 72
    }
}

extension TaskDetailsTableViewController: TaskDetailsHeaderViewDelegate {
    
    func editAction() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alert.view.tintColor = .black
        
        let editAction = UIAlertAction(title: "Edit task", style: .default, handler: alertEditAction)
        let deleteAction = UIAlertAction(title: "Delete Task", style: .destructive, handler: alertDeleteAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(editAction)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true)
    }
    
    func alertEditAction(_ sender: UIAlertAction) {
        presenter.editEction()
    }
    
    func alertDeleteAction(_ sender: UIAlertAction) {
        presenter.deleteAction()
    }
        
}

extension TaskDetailsTableViewController: TaskDetailsViewProtocol {
    
}
