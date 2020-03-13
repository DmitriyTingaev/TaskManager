//
//  SustomSwithConfigure.swift
//  MyTasks
//
//  Created by Macbook on 12.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import UIKit

let kScale: CGFloat = 1.5
let kAlpha: CGFloat = 0.5

extension CustomSwitch {
    
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        firstLabelTransform = CGAffineTransform(scaleX: kScale, y: kScale).translatedBy(x: 26, y: 0)
        stackViewTransform = CGAffineTransform(translationX: view.frame.width / -2, y: 0)
        showingTransform = CGAffineTransform(translationX: view.frame.width / 2, y: 0)
        
        prepareStackElemets()
        addGesture()
        addSubview(view)
    }
    
    func prepareStackElemets() {
        let onLabel = stackElements.first!
        let offLabel = stackElements.last!
        
        onLabel.transform = firstLabelTransform
        offLabel.alpha = kAlpha
    }
    
    func addGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        view.addGestureRecognizer(gesture)
    }
    
    @objc func tapAction() {
        
        let onLabel = stackElements.first!
        let offLabel = stackElements.last!
        
        UIView.animate(withDuration: 0.2, animations: {
            self.stackView.transform = self.stackViewTransform
            offLabel.transform = self.firstLabelTransform
            offLabel.alpha = 1
        }) { complete in
            if complete {
                self.stackView.removeArrangedSubview(onLabel)
                self.stackView.addArrangedSubview(onLabel)
                self.stackView.transform = .identity
                self.stackElements.reverse()
                self.showAnimate(label: onLabel)
            }
        }
    
    }
    
    func showAnimate(label: UILabel) {
        label.transform = showingTransform
        label.alpha = 0
        UIView.animate(withDuration: 0.2, animations: {
            label.transform = .identity
            label.alpha = kAlpha
        }) { complete in
            if complete {
                if let delegate = self.delegate {
                    self.isOn.toggle()
                    delegate.swith(to: self.isOn)
                }
            }
        }
       
    }
    
}
