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

        // prepare the associated view and injecting its viewModel
        let viewModel = FirstViewModel()
        let viewController = ViewController(viewModel: viewModel)

        // for specific events from viewModel, define next navigation
        viewModel.didSelect = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showNextScreen(in: strongSelf.router)
        }

        router.push(viewController, isAnimated: true, onNavigateback: self.isCompleted)
    }

    // we can go further in our flow if we need to
    func showNextScreen(in router: RouterProtocol) {
        let newCoordinator = FirstCoordinator(router: router)
        self.start(coordinator: newCoordinator)
    }
}
