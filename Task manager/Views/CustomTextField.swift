//
//  BaseTextField.swift
//  Task manager
//
//  Created by Macbook on 02.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit
 
class CustomTextField: UITextField {
        
    
    private let padding = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //MARK: - Property
    
    private enum PlaceholderPosition {
        case top, bottom
    }
        
    private var placeholderLable: UILabel!
    private var placeholderPosition: PlaceholderPosition! {
        didSet {
            animatePlaceholder()
        }
    }
    
    private lazy var placeholderCG: CGAffineTransform = {
        let scale = 0.8 as CGFloat
        let translationX = (self.frame.width * (1 - scale)) / -1.6
        let translationY = -self.frame.height + self.placeholderLable.frame.height
        var transform = CGAffineTransform.identity
        transform = transform.scaledBy(x: scale, y: scale)
        transform = transform.translatedBy(x: translationX, y: translationY)
        return transform
    }()
    
    // MARK: - Internal

    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSeparator()
        addPlaceholder()
        configureTextField()
    }
    
    // MARK: - Private
    
    private func configureTextField() {
        delegate = self
        placeholder = nil
        borderStyle = .none
        contentVerticalAlignment = .bottom
        
        if text != nil {
            placeholderPosition = .top
        }
    }
    
    private func addPlaceholder() {
        
        placeholderLable = UILabel()
        
        placeholderLable.text = placeholder
        placeholderLable.frame.origin.x = 0
        placeholderLable.frame.origin.y = frame.height / 2
        placeholderLable.frame.size.width = frame.width
        placeholderLable.frame.size.height = frame.height / 2
        placeholderLable.textColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.2)
        
        addSubview(placeholderLable)
    }

    private func addSeparator() {
        let bottomBorder = CALayer(layer: layer)
        bottomBorder.frame = CGRect(x: 0, y: frame.height - 0.5, width: frame.width, height: 0.5)
        bottomBorder.backgroundColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 0.2)
        layer.addSublayer(bottomBorder)
    }
    
    private func configurePlaceHolderCG() -> CGAffineTransform {
        switch placeholderPosition {
        case .top: return placeholderCG
        case .bottom: return .identity
        case .none: return .identity
        }
    }
    
    // MARK: - Animate

    private func animatePlaceholder() {
   
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.6,
            initialSpringVelocity: 0.5,
            options: .curveEaseIn,
            animations: {
                self.placeholderLable.transform = self.configurePlaceHolderCG()
                
        }, completion: nil)
        
    }
}

// MARK: - UITextFieldDelegate

extension CustomTextField: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        placeholderPosition = .top
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        placeholderPosition = textField.text!.isEmpty ? .bottom : .top
    }
    
}
