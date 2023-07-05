//
//  Router.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 03/07/23.
//

import Foundation
import UIKit

typealias NavigationBackClosure = (() -> ())

protocol RouterProtocol{
    func push(_ drawable: Drawable, isAnimated : Bool, onNavigateback : NavigationBackClosure?)
    func pop(_ isAnimated : Bool)
    func popToRoot(_ isAnimated : Bool)
}
class Router : NSObject, RouterProtocol{
    
    let navigationController : UINavigationController
    private var closures : [String : NavigationBackClosure] = [:]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
    func push(_ drawable: Drawable, isAnimated: Bool, onNavigateback closure: NavigationBackClosure?) {
        let viewController = drawable.viewController
        if let closure = closure {
            closures.updateValue(closure, forKey: viewController.description)
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }
    
    func pop(_ isAnimated: Bool) {
        guard let viewController = navigationController.popViewController(animated: isAnimated) else {
            return
        }
        executeClosue(viewController)
    }
    
    func popToRoot(_ isAnimated: Bool) {
        guard let viewControllers = navigationController.popToRootViewController(animated: isAnimated) else {
            return
        }
        viewControllers.forEach{ executeClosue($0) }
    }
    private func executeClosue(_ viewController : UIViewController){
        guard let closure = closures.removeValue(forKey: viewController.description) else {
            return
        }
        closure()
    }
}
extension Router : UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(previousController) else{
            return
        }
        executeClosue(previousController)
    }
}
