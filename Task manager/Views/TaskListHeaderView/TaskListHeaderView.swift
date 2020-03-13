//
//  TaskListHeaderView.swift
//  Task manager
//
//  Created by Macbook on 06.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

protocol TaskListHeaderViewDelegate: class  {
    func addButtonAction()
}

class TaskListHeaderView: UIView {
    
    weak var delegate: TaskListHeaderViewDelegate!

    class func create(delegate: TaskListHeaderViewDelegate) -> UIView {
        let view = Bundle.main.loadNibNamed("TaskListHeaderView", owner: self, options: nil)?.first as! TaskListHeaderView
        view.delegate = delegate
        return view
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        delegate.addButtonAction()
    }
    
}
