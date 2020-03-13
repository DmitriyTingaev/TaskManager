//
//  TaskEditorHeaderView.swift
//  Task manager
//
//  Created by Macbook on 11.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

protocol TaskEditorHeaderViewDelegate: class {
    func backAction()
}

class TaskEditorHeaderView: UIView {

    weak var delegate: TaskEditorHeaderViewDelegate!

    class func create(delegate: TaskEditorHeaderViewDelegate) -> UIView {
        let view = Bundle.main.loadNibNamed("TaskEditorHeaderView", owner: self, options: nil)?.first as! TaskEditorHeaderView
        view.delegate = delegate
        return view
    }
    
    @IBAction func backAction(_ sender: Any) {
        delegate.backAction()
    }

}
