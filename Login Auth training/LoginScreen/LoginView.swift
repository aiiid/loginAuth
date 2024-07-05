//
//  LoginView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    let mainImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "globe"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let mainText: UILabel = {
        var text = UILabel()
        text.text = "Вэлком бэк!"
        text.font = Constants.Fonts.titleFont
        text.textAlignment = .center
        return text
    }()
    
    let loginTextField = CustomTextField(placeholder: "Введи туда-сюда логин", isPasswordField: false)
    let passwordTextField = CustomTextField(placeholder: "Пароль (тоже введи)", isPasswordField: true)
    let alertView = AlertView()
    
    let loginButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Constants.Colors.primaryColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    let registerButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("У меня еще нет аккаунта", for: .normal)
        button.setTitleColor(Constants.Colors.primaryColor, for: .normal)
        button.setTitleColor(.white, for: .selected)
        button.backgroundColor = .clear
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        backgroundColor = .white
        
        [
            mainImage,
            mainText,
            loginTextField,
            passwordTextField,
            loginButton,
            registerButton,
            alertView
        ].forEach{ addSubview($0)}
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(24)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(94)
        }
        
        mainText.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(mainText.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        alertView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(-170)
            make.height.equalTo(55)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(16)
        }
    }
    
    func showAlert(message: String) {
        alertView.setMessage(message)
    
        alertView.snp.updateConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(-40)
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


