//
//  UILabelFactory.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/1/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct UILabelFactory {
    
    private let label: UILabel
    private var size: CGFloat
    
    // MARK: - Inits
    init(size: Int) {
        label = UILabel()
        self.size = CGFloat(size)
        label.textColor = .black
        label.text = ""
        label.font = .systemFont(ofSize: self.size, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: - Public methods
    func build() -> UILabel {
        return label
    }
    
    func fontSize(of size: CGFloat) -> UILabelFactory {
        label.font = label.font.withSize(size)
        
        return self
    }
    
    func textColor(of color: UIColor) -> UILabelFactory {
        label.textColor = color
        
        return self
    }
    
    func compact() -> UILabelFactory {
        label.font = UIFont(name: "SteelfishEb-Regular", size: size)
        
        return self
    }
    
    func bold() -> UILabelFactory {
        label.font = .systemFont(ofSize: size, weight: .heavy)
        return self
    }
    
    func text(_ text: String) -> UILabelFactory {
        label.text = text
        return self
    }
    
    func align(_ alignment: NSTextAlignment) -> UILabelFactory {
        label.textAlignment = alignment
        return self
    }
}
