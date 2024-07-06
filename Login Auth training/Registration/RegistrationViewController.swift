//
//  RegistrationViewController.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//
import UIKit

class RegistrationViewController: UIViewController {
    private let contentView = RegistrationView()
    private let viewModel = RegistrationViewModel()
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTargets()
        setupObservers()
        setupNavBar()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupNavBar() {
        title = "Регистрация"
    }
    
    private func setupTargets() {
        contentView.passwordTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
        contentView.passwordCheckTextField.addTarget(self, action: #selector(passwordCheckTextChanged), for: .editingChanged)
        contentView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    private func setupObservers() {
        viewModel.passwordValidationResult = { [weak self] result in
            self?.contentView.passwordCheckerView.update(with: result)
        }
        viewModel.passwordMatchResult = { [weak self] match in
            self?.contentView.passwordMatchCheckerView.updateMatch(isMatch: match)
        }
        viewModel.allChecksValidResult = { [weak self] allValid in
            self?.contentView.updateNextButtonState(isEnabled: allValid)
        }
        viewModel.registrationResult = { [weak self] result in
                    switch result {
                    case .success(let message):
                        print(message)
                        if let email = self?.contentView.mailTextField.text {
                            let emailViewController = EmailViewController(email: email)
                            self?.navigationController?.pushViewController(emailViewController, animated: true)
                        }
                    case .failure(let error):
                        if let customMessage = (error as NSError).userInfo[NSLocalizedDescriptionKey] as? String {
                            self?.contentView.showAlert(message: customMessage)
                        } else {
                            self?.contentView.showAlert(message: error.localizedDescription)
                        }
                    }
                }
    }
    
    @objc private func passwordTextChanged(_ textField: UITextField) {
        viewModel.validate(password: textField.text ?? "")
        viewModel.validatePasswordMatch(password: textField.text, confirmPassword: contentView.passwordCheckTextField.text)
    }
    
    @objc private func passwordCheckTextChanged(_ textField: UITextField) {
        viewModel.validatePasswordMatch(password: contentView.passwordTextField.text, confirmPassword: textField.text)
    }
    
    @objc private func nextButtonTapped() {
        let username = contentView.loginTextField.text ?? ""
        let password = contentView.passwordTextField.text ?? ""
        let email = contentView.mailTextField.text ?? ""
        
        viewModel.validateCredentials(username: username, password: password, email: email) { [weak self] result in
            switch result {
            case .success:
                self?.viewModel.register(username: username, password: password, email: email)
            case .failure(let error):
                if let customMessage = (error as NSError).userInfo[NSLocalizedDescriptionKey] as? String {
                    self?.contentView.showAlert(message: customMessage)
                } else {
                    self?.contentView.showAlert(message: error.localizedDescription)
                }
            }
        }
    }
}
