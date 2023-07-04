//
//  Drawable.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 03/07/23.
//

import UIKit

protocol Drawable{
    var viewController : UIViewController { get }
}
extension UIViewController : Drawable{
    var viewController: UIViewController { return self
    }
}
