//
//  UIExtensions.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/2/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

extension UIView {
    
    @discardableResult
    func constrainTop(to anchor: NSLayoutYAxisAnchor, at margin: CGFloat = 0) -> UIView {
        self.topAnchor.constraint(equalTo: anchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func constrainBottom(to anchor: NSLayoutYAxisAnchor, at margin: CGFloat = 0) -> UIView {
        self.bottomAnchor.constraint(equalTo: anchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func constrainLead(to anchor: NSLayoutXAxisAnchor, at margin: CGFloat = 0) -> UIView {
        self.leadingAnchor.constraint(equalTo: anchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func constrainTrail(to anchor: NSLayoutXAxisAnchor, at margin: CGFloat = 0) -> UIView {
        self.trailingAnchor.constraint(equalTo: anchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func constrainCenterX(to anchor: NSLayoutXAxisAnchor, at margin: CGFloat = 0) -> UIView {
        self.centerXAnchor.constraint(equalTo: anchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func constrainCenterY(to anchor: NSLayoutYAxisAnchor, at margin: CGFloat = 0) -> UIView {
        self.centerYAnchor.constraint(equalTo: anchor, constant: margin).isActive = true
        return self
    }
    
    @discardableResult
    func constrainWidth(to width: CGFloat) -> UIView {
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        return self
    }
    
    @discardableResult
    func constrainHeight(to height: CGFloat) -> UIView {
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        return self
    }
}
