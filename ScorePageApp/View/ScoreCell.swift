//
//  ScoreCell.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class ScoreCell: UICollectionViewCell {
    
    var homeLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.constrainWidth(to: 30).constrainHeight(to: 30)
        return image
    }()
    
    var awayLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.constrainWidth(to: 30).constrainHeight(to: 30)
        return image
    }()
    
    var homeLabel = UILabelFactory(size: 30).compact().build()
    var awayLabel = UILabelFactory(size: 30).compact().build()
    
    //live and final
    var homeScoreLabel = UILabelFactory(size: 30).compact().align(.right).build()
    var awayScoreLabel = UILabelFactory(size: 30).compact().align(.right).build()
    
    var liveChannelLabel = UILabelFactory(size: 12).bold().textColor(of: .red).build()

    var clockLabel = UILabelFactory(size: 12).build()
    
    //upcoming
    var timeLabel = UILabelFactory(size: 12).build()
    var channelLabel = UILabelFactory(size: 12).build()
    
    var favoriteLabel = UILabelFactory(size: 12).build()
    var overUnderLabel = UILabelFactory(size: 12).build()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        homeLogo.image = nil
        awayLogo.image = nil
        homeLabel.text = nil
        awayLabel.text = nil
        homeScoreLabel.text = nil
        awayScoreLabel.text = nil
        channelLabel.text = nil
        liveChannelLabel.text = nil
        timeLabel.text = nil
        clockLabel.text = nil
        favoriteLabel.text = nil
        overUnderLabel.text = nil
    }
    
    func injectData(event: Event) {
        let presenter = EventPresenter(event: event)
        let homeTeam = presenter.homeTeam
        homeLogo.image = homeTeam.0
        homeLabel.text = homeTeam.1
        
        let awayTeam = presenter.awayTeam
        awayLogo.image = awayTeam.0
        awayLabel.text = awayTeam.1
        
        if event.state == .upcoming {
            
            setupUpcomingComponents()
            timeLabel.text = presenter.time
            channelLabel.text = presenter.station
            
            favoriteLabel.text = presenter.favorite
            overUnderLabel.text = presenter.overUnder
            
        } else { //live or final
            
            setupLiveComponents()
            let scores = presenter.scores
            awayScoreLabel.text = scores.0
            homeScoreLabel.text = scores.1
            
            clockLabel.text = presenter.clock
            liveChannelLabel.text = presenter.station
        }
    }
    
    private func setupComponents() {
        contentView.addSubview(homeLogo)
        contentView.addSubview(awayLogo)
        contentView.addSubview(homeLabel)
        contentView.addSubview(awayLabel)
        
        awayLogo.constrainLead(to: contentView.leadingAnchor, at: 25).constrainTop(to: contentView.topAnchor, at: 45)
        homeLogo.constrainLead(to: contentView.leadingAnchor, at: 25).constrainTop(to: awayLogo.bottomAnchor, at: 10)
        
        awayLabel.constrainLead(to: awayLogo.trailingAnchor, at: 10).constrainCenterY(to: awayLogo.centerYAnchor).constrainWidth(to: 60)
        homeLabel.constrainLead(to: homeLogo.trailingAnchor, at: 10).constrainCenterY(to: homeLogo.centerYAnchor).constrainWidth(to: 60)
    }
    
    func setupLiveComponents() {
        contentView.addSubview(homeScoreLabel)
        contentView.addSubview(awayScoreLabel)
        contentView.addSubview(liveChannelLabel)
        contentView.addSubview(clockLabel)
        
        awayScoreLabel.constrainTrail(to: contentView.trailingAnchor, at: -25).constrainCenterY(to: awayLogo.centerYAnchor)
        homeScoreLabel.constrainTrail(to: contentView.trailingAnchor, at: -25).constrainCenterY(to: homeLogo.centerYAnchor)

        liveChannelLabel.constrainTrail(to: contentView.trailingAnchor, at: -25).constrainBottom(to: contentView.bottomAnchor, at: -35)
        clockLabel.constrainLead(to: contentView.leadingAnchor, at: 25).constrainBottom(to: contentView.bottomAnchor, at: -35)
    }
    
    func setupUpcomingComponents() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(channelLabel)
        contentView.addSubview(favoriteLabel)
        contentView.addSubview(overUnderLabel)
        
        timeLabel.constrainBottom(to: awayLogo.bottomAnchor, at: 5).constrainTrail(to: contentView.trailingAnchor, at: -25)
        channelLabel.constrainTop(to: homeLogo.topAnchor, at: -5).constrainTrail(to: contentView.trailingAnchor, at: -25)
        
        favoriteLabel.constrainLead(to: contentView.leadingAnchor, at: 25).constrainBottom(to: contentView.bottomAnchor, at: -35)
        overUnderLabel.constrainTrail(to: contentView.trailingAnchor, at: -25).constrainBottom(to: contentView.bottomAnchor, at: -35)
    }
}
