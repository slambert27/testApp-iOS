//
//  EventViewController.swift
//  ScorePageApp
//
//  Created by Samuel Lambert on 5/15/19.
//  Copyright © 2019 Sam Lambert. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    
    let presenter: EventPresenter
    
    init(with presenter: EventPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let detailView = EventDetailView(with: presenter)
        view.addSubview(detailView)
        detailView.constrainTop(to: view.topAnchor).constrainBottom(to: view.bottomAnchor).constrainLead(to: view.leadingAnchor).constrainTrail(to: view.trailingAnchor)
    }
}
