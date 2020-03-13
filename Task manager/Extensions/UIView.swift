//
//  UIView.swift
//  Task manager
//
//  Created by Macbook on 02.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
     @IBInspectable var cornerRadius: CGFloat {
         set { layer.cornerRadius = newValue  }
         get { return layer.cornerRadius }
     }

    @IBInspectable var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set { layer.borderColor = newValue?.cgColor }
        get { return UIColor(cgColor: layer.borderColor!) }
    }

    @IBInspectable var shadowOffset: CGSize {
        set { layer.shadowOffset = newValue  }
        get { return layer.shadowOffset }
    }

    @IBInspectable var shadowOpacity: Float {
        set { layer.shadowOpacity = newValue }
        get { return layer.shadowOpacity }
    }

    @IBInspectable var shadowRadius: CGFloat {
        set {  layer.shadowRadius = newValue }
        get { return layer.shadowRadius }
    }

    @IBInspectable var shadowColor: UIColor? {
        set { layer.shadowColor = newValue?.cgColor }
        get { return UIColor(cgColor: layer.shadowColor!) }
    }
    
    
    func showAnimation() {
        alpha = 0
        transform = CGAffineTransform(translationX: frame.width / 2, y: 0)
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
            self.transform = .identity
        }
    }

}
