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
        setupKeyboardObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupTargets() {
        contentView.passwordTextField.addTarget(self, action: #selector(passwordTextChanged), for: .editingChanged)
    }
    
    private func setupObservers() {
        viewModel.passwordValidationResult = { [weak self] result in
            self?.contentView.passwordCheckerView.update(with: result)
        }
    }
    
    private func setupKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func passwordTextChanged(_ textField: UITextField) {
        viewModel.validate(password: textField.text ?? "")
    }
    
    @objc private func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            let keyboardHeight = keyboardFrame.height
            UIView.animate(withDuration: 0.3) {
                self.contentView.bottomConstraint?.update(offset: -keyboardHeight)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.contentView.bottomConstraint?.update(offset: 0)
            self.view.layoutIfNeeded()
        }
    }
}
