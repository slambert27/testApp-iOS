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
    
    var bottomNav: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var header = UILabelFactory(size: 40).compact().header(text: "SCORES").build()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: topNav.frame.maxY, left: 0, bottom: 0, right: 0)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Register cell classes
        collectionView.register(ScoreCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        collectionView.backgroundColor = .clear
        self.view.backgroundColor = UIColor.init(red: 210.0/255.0, green: 210.0/255.0, blue: 210.0/255.0, alpha: 1)
        
        self.view.addSubview(collectionView)
        self.view.addSubview(topNav)
        topNav.addSubview(header)
        self.view.addSubview(bottomNav)
        
        setConstraints()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
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
        
        return CGSize(width: collectionViewSize/2, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func setConstraints() {
        topNav.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        topNav.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        topNav.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        topNav.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        header.bottomAnchor.constraint(equalTo: topNav.bottomAnchor, constant: -10).isActive = true
        header.leadingAnchor.constraint(equalTo: topNav.leadingAnchor, constant: 20).isActive = true
        
        bottomNav.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        bottomNav.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        bottomNav.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        bottomNav.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topNav.bottomAnchor, constant: 1).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomNav.topAnchor, constant: -1).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
    }
}
