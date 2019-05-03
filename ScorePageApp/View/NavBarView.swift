//
//  NavBar.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/2/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class NavBarView: UIView {
        
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        constrainHeight(to: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
