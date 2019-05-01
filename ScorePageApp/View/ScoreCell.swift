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
        return image
    }()
    
    var awayLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var homeLabel = UILabelFactory(size: 22).bold().compact().build()
    var awayLabel = UILabelFactory(size: 22).bold().compact().build()
    
    
    //live and final
    var homeScoreLabel = UILabelFactory(size: 22).bold().compact().build()
    var awayScoreLabel = UILabelFactory(size: 22).bold().compact().build()
    
    var liveChannelLabel = UILabelFactory(size: 12).bold().textColor(of: .red).build()
    
    var clockLabel = UILabelFactory(size: 12).build()
    
    //upcoming
    var timeLabel = UILabelFactory(size: 12).build()
    var channelLabel = UILabelFactory(size: 12).build()
    
    var favoriteLabel = UILabelFactory(size: 12).build()
    var overUnderLabel = UILabelFactory(size: 12).build()
    
    var constrainer: Constraints?

    override init(frame: CGRect) {
        super.init(frame: frame)
        constrainer = Constraints(contentView: contentView)
        
        setupComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func injectData(event: Event) {
        let presenter = EventPresenter(event: event)
        let homeTeam = presenter.getHomeTeam()
        homeLogo.image = homeTeam.0
        homeLabel.text = homeTeam.1
        
        let awayTeam = presenter.getAwayTeam()
        awayLogo.image = awayTeam.0
        awayLabel.text = awayTeam.1
        
        if event.state == .upcoming {
            
            setupUpcomingComponents()
            timeLabel.text = presenter.getTime()
            channelLabel.text = presenter.getStation()
            
            favoriteLabel.text = presenter.getFavorite()
            overUnderLabel.text = presenter.getOverUnder()
            
        } else { //live or final
            
            setupLiveComponents()
            let scores = presenter.getScores()
            awayScoreLabel.text = scores.0
            homeScoreLabel.text = scores.1
            
            clockLabel.text = presenter.getClock()
            liveChannelLabel.text = presenter.getStation()
        }
    }
    
    private func setupComponents() {
        contentView.addSubview(homeLogo)
        contentView.addSubview(awayLogo)
        contentView.addSubview(homeLabel)
        contentView.addSubview(awayLabel)
        
        constrainer!.constrainLogo(awayLogo)
        constrainer!.constrainLogo(homeLogo)
        
        awayLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40).isActive = true
        homeLogo.topAnchor.constraint(equalTo: awayLogo.bottomAnchor, constant: 10).isActive = true
        
        constrainer!.constrainNameToLogo(constrain: awayLabel, to: awayLogo)
        constrainer!.constrainNameToLogo(constrain: homeLabel, to: homeLogo)
    }
    
    func setupLiveComponents() {
        contentView.addSubview(homeScoreLabel)
        contentView.addSubview(awayScoreLabel)
        contentView.addSubview(liveChannelLabel)
        contentView.addSubview(clockLabel)
        
        constrainer!.constrainScoreToLogo(constrain: awayScoreLabel, to: awayLogo)
        constrainer!.constrainScoreToLogo(constrain: homeScoreLabel, to: homeLogo)
        
        constrainer!.constrainStation(label: liveChannelLabel)
        constrainer!.constrainClock(label: clockLabel)
    }
    
    func setupUpcomingComponents() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(channelLabel)
        contentView.addSubview(favoriteLabel)
        contentView.addSubview(overUnderLabel)
        
        constrainer!.constrainTimeToAway(constrain: timeLabel, to: awayLogo)
        constrainer!.constrainChannelToHome(constrain: channelLabel, to: homeLogo)
        
        constrainer!.constrainFavorite(label: favoriteLabel)
        constrainer!.constrainOverUnder(label: overUnderLabel)
    }
}
