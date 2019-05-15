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
    
    var events = Constants.eventList
    
    var topNav: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        let header = UILabelFactory(size: 40).compact().text("SCORES").build()
        view.addSubview(header)
        header.constrainBottom(to: view.bottomAnchor, at: -10).constrainLead(to: view.leadingAnchor, at: 25)
        return view
    }()
    
    var dayNav: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = "dayNav"
        var day = UILabelFactory(size: 12).text("Today").build()
        view.addSubview(day)
        day.constrainCenterY(to: view.centerYAnchor).constrainLead(to: view.leadingAnchor, at: 25)
        return view
    }()
    
    var bottomNav = NavBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.accessibilityIdentifier = "ScoresView"
        
        // Register cell classes
        collectionView.register(ScoreCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.init(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1)
        
        view.addSubview(collectionView)
        view.addSubview(topNav)
        view.addSubview(dayNav)
        view.addSubview(bottomNav)
        
        setConstraints()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if Constants.eventList.count.isMultiple(of: 2) {
            return events.count
        } else {
            return events.count + 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ScoreCell
        cell.backgroundColor = .white
        
        if indexPath.row < events.count {
            cell.injectData(presenter: CellPresenter(event: events[indexPath.row]))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ScoreCell
        if let event = cell.presenter?.event {
            let eventController = EventViewController(with: EventPresenter(event: event))
            navigationController?.pushViewController(eventController, animated: true)
        }
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
        topNav.constrainTop(to: view.topAnchor).constrainLead(to: view.leadingAnchor).constrainTrail(to: view.trailingAnchor).constrainHeight(to: 100)
        dayNav.constrainTop(to: topNav.bottomAnchor, at: 1).constrainLead(to: view.leadingAnchor).constrainTrail(to: view.trailingAnchor).constrainHeight(to: 36)
        bottomNav.constrainBottom(to: view.bottomAnchor).constrainLead(to: view.leadingAnchor).constrainTrail(to: view.trailingAnchor)
        collectionView.constrainTop(to: dayNav.bottomAnchor, at: 1).constrainBottom(to: bottomNav.topAnchor, at: -1).constrainLead(to: view.leadingAnchor).constrainTrail(to: view.trailingAnchor)
    }
}
