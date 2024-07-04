//
//  loginViewController.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//

import UIKit

class SplashScreenViewController: UIViewController {
    private let contentView = SplashView()
    private var selectedCategoryIndex: IndexPath?
    
    override func loadView() {
        view = contentView
    }
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            // Simulate a loading delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.showMainScreen()
            }
        }
    func showMainScreen() {
            let loginViewController = LoginViewController() // Replace with your initial view controller
            let navigationController = UINavigationController(rootViewController: loginViewController)
            
            guard let window = view.window else { return }
            
            window.rootViewController = navigationController
            UIView.transition(with: window,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        } 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
