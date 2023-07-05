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
    lazy var myViewController: ViewController = {
        let viewModel = FirstViewModel()
        let viewController = ViewController(viewModel: viewModel)
        return viewController
        }()
    override func start() {

        // prepare the associated view and injecting its viewModel
//        let viewModel = FirstViewModel()
//        let myViewController = ViewController(viewModel: viewModel)

        // for specific events from viewModel, define next navigation
        myViewController.viewModel.didSelect = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showNextScreen(in: strongSelf.router)
        }

        router.push(myViewController, isAnimated: true, onNavigateback: self.isCompleted)
    }

    // we can go further in our flow if we need to
    func showNextScreen(in router: RouterProtocol) {
        let newCoordinator = FirstCoordinator(router: router)
        self.start(coordinator: newCoordinator)
    }
}
extension FirstCoordinator : Drawable {
    var viewController: UIViewController {
        return myViewController
    }
}
