//
//  HomeViewController.swift
//  Login Auth training
//
//  Created by Ai Hawok on 05/07/2024.
//

import UIKit

class HomeViewController: UIViewController {
    private let contentView = HomeView()
    
    override func loadView() {
        view = contentView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        checkForJWTToken()
    }
    
    private func checkForJWTToken() {
        if let token = UserDefaults.standard.string(forKey: "jwtToken") {
            print("JWT Token found: \(token)")
            // Handle the presence of the token, e.g., navigate to a protected area of the app
        } else {
            print("No JWT Token found")
            // Handle the absence of the token, e.g., show the login screen
        }
    }
    
    private func setupTargets() {
        contentView.exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
    }
    
    @objc func exitButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
