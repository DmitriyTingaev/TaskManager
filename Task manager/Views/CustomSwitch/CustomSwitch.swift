//
//  CustomSwitch.swift
//  MyTasks
//
//  Created by Macbook on 11.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

protocol CustomSwitchDelegate: class {
    func swith(to: Bool)
}

@IBDesignable
class CustomSwitch: UIView {
        
    @IBOutlet weak var stackView: UIStackView!
    lazy var stackElements: [UILabel] = stackView!.arrangedSubviews as! [UILabel]
    
    var view: UIView!
    var isOn: Bool! = false
    weak var delegate: CustomSwitchDelegate?
    
    var firstLabelTransform: CGAffineTransform!
    var stackViewTransform: CGAffineTransform!
    var showingTransform: CGAffineTransform!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
        
    func loadViewFromNib () -> UIView {
        let bundle = Bundle(for: Self.self)
        let nib = UINib(nibName: "CustomSwitch", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }

}
