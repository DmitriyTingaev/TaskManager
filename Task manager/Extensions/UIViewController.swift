//
//  UIViewController.swift
//  Task manager
//
//  Created by Macbook on 04.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func create() -> Self {
        return UIStoryboard
            .init(name: "Main", bundle: Bundle.main)
            .instantiateViewController(identifier: String(describing: self))
    }

}
