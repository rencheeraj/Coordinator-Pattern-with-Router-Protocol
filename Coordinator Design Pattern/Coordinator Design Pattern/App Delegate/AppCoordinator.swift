//
//  AppCoordinator.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 04/07/23.
//

import Foundation
import UIKit

class AppCoordinator : BaseCoordinator{
    let window : UIWindow
    init(window: UIWindow) {
        self.window = window
        super.init()
    }
    override func start() {
        let router = Router(navigationController: UINavigationController())
        let myCoordinator = FirstCoordinator(router: router)
        
        self.start(coordinator: myCoordinator)
        
        window.rootViewController = router.navigationController
        window.makeKeyAndVisible()
    }
}
