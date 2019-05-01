//
//  Constraints.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/1/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

struct Constraints {
    
    let contentView: UIView
    
    func constrainLogo(_ image: UIImageView) {
        image.heightAnchor.constraint(equalToConstant: 40).isActive = true
        image.widthAnchor.constraint(equalToConstant: 40).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    func constrainNameToLogo(constrain label: UILabel, to image: UIImageView) {
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        label.centerYAnchor.constraint(equalTo: image.centerYAnchor, constant: 0).isActive = true
        label.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func constrainScoreToLogo(constrain label: UILabel, to image: UIImageView) {
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        label.centerYAnchor.constraint(equalTo: image.centerYAnchor, constant: 0).isActive = true
        label.textAlignment = .right
    }
    
    func constrainStation(label: UILabel) {
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
    }
    
    func constrainClock(label: UILabel) {
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
    }
    
    func constrainTimeToAway(constrain label: UILabel, to image: UIImageView) {
        label.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    func constrainChannelToHome(constrain label: UILabel, to image: UIImageView) {
        label.topAnchor.constraint(equalTo: image.topAnchor, constant: -5).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    func constrainFavorite(label: UILabel) {
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
    }
    
    func constrainOverUnder(label: UILabel) {
        label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
    }
}
