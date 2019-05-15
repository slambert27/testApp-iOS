//
//  EventDetailView.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/15/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class EventDetailView: UIView {
    
    let presenter: EventPresenter
    
    let header = UILabelFactory(size: 20).build()

    var homeLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.constrainWidth(to: 40).constrainHeight(to: 40)
        return image
    }()
    
    var awayLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.constrainWidth(to: 40).constrainHeight(to: 40)
        return image
    }()
    
    let homeLabel = UILabelFactory(size: 30).compact().id("homeName").build()
    let awayLabel = UILabelFactory(size: 30).compact().id("awayName").build()
    
    let homeRecord = UILabelFactory(size: 14).build()
    let awayRecord = UILabelFactory(size: 14).build()
    
    init(with presenter: EventPresenter) {
        self.presenter = presenter
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        setupComponents()
        setData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setData() {
        header.text = presenter.header
        homeLogo.image = presenter.homeLogo
        homeLabel.text = presenter.homeName
        awayLogo.image = presenter.awayLogo
        awayLabel.text = presenter.awayName
        awayRecord.text = presenter.awayRecord
        homeRecord.text = presenter.homeRecord
    }
    
    private func setupComponents() {
        addSubview(homeLogo)
        addSubview(awayLogo)
        addSubview(homeLabel)
        addSubview(awayLabel)
        addSubview(header)
        addSubview(awayRecord)
        addSubview(homeRecord)
        
        header.constrainTop(to: safeAreaLayoutGuide.topAnchor, at: 20).constrainCenterX(to: centerXAnchor)
        
        awayLogo.constrainLead(to: leadingAnchor, at: 25).constrainTop(to: header.bottomAnchor, at: 50)
        homeLogo.constrainLead(to: leadingAnchor, at: 25).constrainTop(to: awayLogo.bottomAnchor, at: 20)
        
        awayLabel.constrainLead(to: awayLogo.trailingAnchor, at: 20).constrainCenterY(to: awayLogo.centerYAnchor)
        homeLabel.constrainLead(to: homeLogo.trailingAnchor, at: 20).constrainCenterY(to: homeLogo.centerYAnchor)
        
        awayRecord.constrainBottom(to: awayLabel.bottomAnchor).constrainLead(to: awayLabel.trailingAnchor, at: 10)
        homeRecord.constrainBottom(to: homeLabel.bottomAnchor).constrainLead(to: homeLabel.trailingAnchor, at: 10)
    }
}
