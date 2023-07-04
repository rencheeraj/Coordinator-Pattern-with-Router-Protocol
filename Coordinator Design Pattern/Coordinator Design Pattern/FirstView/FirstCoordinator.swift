//
//  FirstCoordinator.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 04/07/23.
//

import UIKit

class FirstCoordinator : BaseCoordinator{
    let router : RouterProtocol
    init(router: RouterProtocol) {
        self.router = router
    }
    override func start() {
        
    }
}
