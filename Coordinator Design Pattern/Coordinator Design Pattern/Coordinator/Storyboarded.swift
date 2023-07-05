//
//  Storyboarded.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 05/07/23.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static func instantiate() -> Self
}
extension StoryBoarded where Self : UIViewController{
    // MARK: - Properties
    static var storyboardName : String{
        return "Main"
    }
    static var storyboardBundle: Bundle{
        return .main
    }
    static var storyboardIdentifier: String{
        return String(describing: self)
    }
    static func instantiate() -> Self{
        guard let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle).instantiateViewController(withIdentifier: storyboardIdentifier) as? Self else{
            fatalError("Unable to Instantiate View Controller With Storyboard Identifier \(storyboardIdentifier)")
        }
        return storyboard
    }
}
