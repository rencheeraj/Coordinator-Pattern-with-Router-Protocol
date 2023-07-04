//
//  FirstViewModel.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 04/07/23.
//

import UIKit

class FirstViewModel {
    var didSelect : (() -> ())?
    var didTapBack : (() -> ())?
    
    let backgroundColor: UIColor
    
    init() {
        self.backgroundColor = FirstViewModel.randomizeColor()
    }
    
    static func randomizeColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}
