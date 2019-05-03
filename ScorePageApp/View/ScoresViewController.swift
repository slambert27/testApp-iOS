//
//  ScoresViewController.swift
//  ScorePageApp
//
//  Created by Sam Lambert on 4/30/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class ScoresViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private let reuseIdentifier = "Cell"
    
    var collectionView: UICollectionView!
    
    var topNav: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var dayNav: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var bottomNav = NavBarView()
    
    var header = UILabelFactory(size: 40).compact().text("SCORES").build()
    var day = UILabelFactory(size: 12).text("Today").build()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell classes
        collectionView.register(ScoreCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.backgroundColor = UIColor.init(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1)
        
        self.view.addSubview(collectionView)
        self.view.addSubview(topNav)
        self.view.addSubview(dayNav)
        self.view.addSubview(bottomNav)
        
        topNav.addSubview(header)
        dayNav.addSubview(day)
        
        setConstraints()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if Constants.eventList.count.isMultiple(of: 2) {
            return Constants.eventList.count
        } else {
            return Constants.eventList.count + 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScoreCell
        cell.backgroundColor = .white
        
        if indexPath.row < Constants.eventList.count {
            cell.injectData(event: Constants.eventList[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  1
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func setConstraints() {
        topNav.constrainTop(to: self.view.topAnchor).constrainLead(to: self.view.leadingAnchor).constrainTrail(to: self.view.trailingAnchor).constrainHeight(to: 100)
        
        header.constrainBottom(to: topNav.bottomAnchor, at: -10).constrainLead(to: topNav.leadingAnchor, at: 25)
        
        dayNav.constrainTop(to: topNav.bottomAnchor, at: 1).constrainLead(to: self.view.leadingAnchor).constrainTrail(to: self.view.trailingAnchor).constrainHeight(to: 36)
        
        day.constrainCenterY(to: dayNav.centerYAnchor).constrainLead(to: dayNav.leadingAnchor, at: 25)
        
        bottomNav.constrainBottom(to: self.view.bottomAnchor).constrainLead(to: self.view.leadingAnchor).constrainTrail(to: self.view.trailingAnchor)
        
        collectionView.constrainTop(to: dayNav.bottomAnchor, at: 1).constrainBottom(to: bottomNav.topAnchor, at: -1).constrainLead(to: self.view.leadingAnchor).constrainTrail(to: self.view.trailingAnchor)
    }
}
