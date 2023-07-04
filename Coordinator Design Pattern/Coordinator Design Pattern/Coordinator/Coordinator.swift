//
//  Coordinator.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 03/07/23.
//

import Foundation
protocol Coordinator : AnyObject{
    var childCoordinators : [Coordinator] { get set }
    func start()
}
extension Coordinator {
    func store(coordinator : Coordinator){
        childCoordinators.append(coordinator)
    }
    func free(coordinator: Coordinator?) {
        guard let coordinator = coordinator else {
            return
        }
        childCoordinators = childCoordinators.filter({ $0 !== coordinator })
    }
}
