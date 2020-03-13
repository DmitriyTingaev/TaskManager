//
//  TaskListTableViewCell.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var levelIndicatorView: UIView!
    @IBOutlet weak var backView: UIView!

    var model: Task! {
        didSet {
            
            levelLabel.text = self.model.priority?.rawValue
            descriptionLabel.text = self.model.title
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
            dateFormatter.timeZone = TimeZone(identifier: "UTC")
            let dateString = dateFormatter.string(from: self.model.dueBy!)
            
            deadlineLabel.text = "Due to " + dateString
            
            var rbg: Int
            
            switch self.model.priority {
                
            case .low: rbg = 0xCCCCCC
            case .high: rbg = 0xFFCCCC
            case .normal: rbg = 0xD0CCFF
            case .none: rbg = 0xCCCCCC
                
            }
            
            let indicatorColor = UIColor(rgb: rbg)
            
            levelLabel.textColor = indicatorColor
            levelIndicatorView.backgroundColor = indicatorColor
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        backView.layer.cornerRadius = 12
        backView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowRadius = 8
        backView.layer.shadowOpacity = 0.1
        backView.layer.shadowOffset  = .zero
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
