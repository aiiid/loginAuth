//
//  EmailViewController.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//

import UIKit

class EmailViewController: UIViewController {
    private let contentView = EmailView()
    private let email: String
    
    init(email: String) {
        self.email = email
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
        contentView.setEmailText(email) // Set the email text here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
    }
    
    private func setupTargets() {
        contentView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        contentView.noMailButton.addTarget(self, action: #selector(noMailButtonTapped), for: .touchUpInside)
    }
    
    @objc func loginButtonTapped() {
        let loginViewController = LoginViewController()
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            let navigationController = UINavigationController(rootViewController: loginViewController)
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                window.rootViewController = navigationController
            }, completion: nil)
            window.makeKeyAndVisible()
        }
    }
    
    @objc func noMailButtonTapped() {
        presentPopup(
            title: "Мы выслали еще одно письмо на указанную тобой почту \(email)",
            message: "Не забудь проверить ящик “Спам”!11!!!!",
            buttonText: "Понятно!!1!"
        )
    }
    
    private func presentPopup(title: String, message: String, buttonText: String) {
        let popupVC = PopupViewController(title: title, message: message, buttonTitle: buttonText)
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.onDismiss = { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        present(popupVC, animated: true, completion: nil)
    }
}

