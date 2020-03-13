//
//  LoadingView.swift
//  Task manager
//
//  Created by Macbook on 10.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    class func create() -> UIView {
        return Bundle.main.loadNibNamed("LoadingView", owner: self, options: nil)?.first as! LoadingView
    }

}
