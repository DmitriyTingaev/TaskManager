//
//  TaskListTableViewController.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    lazy var presenter = TaskListPresenter(self)
    
    var dataSource = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    
        presenter.updateTaskList()
    }
    
    @objc func refreshData(_ sender: Any) {
        presenter.updateTaskList()
    }
    
}

// MARK: - Table view data source

extension TaskListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(TaskListTableViewCell.self, indexPath)
        cell.model = dataSource[indexPath.row ]
        return cell
    }
        
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.showAnimation()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.tapTaskAction(index: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return TaskListHeaderView.create(delegate: self)
    }
    
}

extension TaskListTableViewController: TaskListViewProtocol {
    
    func updateTableView(data: [Task]) {
        dataSource = data
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
    
}

extension TaskListTableViewController: TaskListHeaderViewDelegate {
    
    func addButtonAction() {
        presenter.addTaskAction()
    }

}
