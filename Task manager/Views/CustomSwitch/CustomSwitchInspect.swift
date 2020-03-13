//
//  CustomSwitchInspect.swift
//  MyTasks
//
//  Created by Macbook on 12.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

extension CustomSwitch {
    
    @IBInspectable var onString: String {
        set { stackElements.first!.text = newValue }
        get { return stackElements.first!.text ?? "On" }
    }
    
    @IBInspectable var offString: String {
        set { stackElements.last!.text = newValue }
        get { return stackElements.last!.text ?? "Off" }
    }
        
}
