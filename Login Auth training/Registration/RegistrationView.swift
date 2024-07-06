//
//  RegistrationView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//
import UIKit
import SnapKit

class RegistrationView: UIView {
    
    let mainText: UILabel = {
        var text = UILabel()
        text.text = "Создать аккаунт Lorby"
        text.font = Constants.Fonts.titleFont
        text.textAlignment = .center
        return text
    }()
    
    let mailTextField = CustomTextField(placeholder: "Введите адрес почты", isPasswordField: false)
    let loginTextField = CustomTextField(placeholder: "Придумай логин", isPasswordField: false)
    let passwordTextField = CustomTextField(placeholder: "Создай пароль", isPasswordField: true)
    let passwordCheckerView = PasswordCheckerView()
    let passwordCheckTextField = CustomTextField(placeholder: "Повтори пароль", isPasswordField: true)
    let passwordMatchCheckerView = PasswordMatchCheckerView()
    
    let alertView = AlertView()
    
    let nextButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Далее", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Constants.Colors.primary.withAlphaComponent(0.3)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func updateNextButtonState(isEnabled: Bool) {
        nextButton.isEnabled = isEnabled
        nextButton.backgroundColor = isEnabled ? Constants.Colors.primary : Constants.Colors.primary.withAlphaComponent(0.5)
    }
    
    private func setupView() {
        backgroundColor = .white
        
        [
            mainText,
            mailTextField,
            loginTextField,
            passwordTextField,
            passwordCheckerView,
            passwordCheckTextField,
            passwordMatchCheckerView,
            nextButton,
            alertView // Ensure alertView is added here
        ].forEach { addSubview($0) }
        
        mainText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.leading.trailing.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        mailTextField.snp.makeConstraints { make in
            make.top.equalTo(mainText.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(mailTextField.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
        
        passwordCheckerView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
        }
        
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckerView.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
        
        passwordMatchCheckerView.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordMatchCheckerView.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.medium)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
        
        alertView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.small)
            make.height.equalTo(Constants.Size.textFieldHeight)
            make.top.equalTo(safeAreaLayoutGuide).inset(-170)
        }
    }
    
    func showAlert(message: String) {
        alertView.setMessage(message)
        
        layoutIfNeeded()
        
        alertView.snp.updateConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(5)
        }
        
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.alertView.snp.updateConstraints { make in
                    make.top.equalTo(self.safeAreaLayoutGuide).inset(-170)
                }
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.layoutIfNeeded()
                })
            }
        }
    }
}
