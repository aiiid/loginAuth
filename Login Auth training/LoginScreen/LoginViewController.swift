//
//  LoginViewController.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//


import UIKit

class LoginViewController: UIViewController {
    private let contentView = LoginView()
    private var selectedCategoryIndex: IndexPath?
    
    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
