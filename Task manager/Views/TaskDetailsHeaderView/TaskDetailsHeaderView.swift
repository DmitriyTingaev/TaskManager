//
//  TaskDetailsHeaderView.swift
//  Task manager
//
//  Created by Macbook on 06.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

protocol TaskDetailsHeaderViewDelegate: class {
    func editAction()
}

class TaskDetailsHeaderView: UIView {
    
    @IBOutlet weak var PriorityLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    weak var delegate: TaskDetailsHeaderViewDelegate!

    class func create(priority: String, color: UIColor, delegate: TaskDetailsHeaderViewDelegate) -> UIView {
        let view = Bundle.main.loadNibNamed("TaskDetailsHeaderView", owner: self, options: nil)?.first as! TaskDetailsHeaderView
        view.delegate = delegate
        view.PriorityLabel.text = priority
        view.PriorityLabel.textColor = color
        view.indicatorView.backgroundColor = color
        return view
    }
    
    @IBAction func editButtonAction(_ sender: Any) {
        delegate.editAction() 
    }

}
