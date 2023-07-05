//
//  ViewController.swift
//  Coordinator Design Pattern
//
//  Created by Rencheeraj Mohan on 03/07/23.
//

import UIKit

class ViewController: UIViewController{

    let viewModel : FirstViewModel
    required init(viewModel : FirstViewModel) {
        self.viewModel = viewModel
        super.init()
    }
    required init?(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = viewModel.backgroundColor
        
        let button = UIButton(type: .custom)
        button.setTitle("Push new view", for: .normal)
        button.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.tag = 0
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 220),
            button.heightAnchor.constraint(equalToConstant: 48),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        let buttonN = UIButton(type: .custom)
        buttonN.setTitle("Pop To Root", for: .normal)
        buttonN.addTarget(self, action: #selector(ViewController.buttonTapped(_:)), for: .touchUpInside)
        buttonN.translatesAutoresizingMaskIntoConstraints = false
        buttonN.tag = 1
        buttonN.backgroundColor = .black
        view.addSubview(buttonN)
        
        NSLayoutConstraint.activate([
            buttonN.widthAnchor.constraint(equalToConstant: 220),
            buttonN.heightAnchor.constraint(equalToConstant: 48),
            buttonN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonN.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80)
        ])
    }

    @objc func buttonTapped(_ button: UIButton) {
        if button.tag == 0{
            viewModel.didSelect?()
        } else{
            
        }
    }
}

