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
        text.textAlignment = .center
        return text
    }()
    
    let loginTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Введи туда-сюда логин"
        return textField
    }()
    
    let passwordTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Пароль (тоже введи)"
        return textField
    }()
    
    let loginButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Constants.Colors.primaryColor
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
        [mainImage, mainText, loginTextField, passwordTextField, loginButton, registerButton].forEach{ addSubview($0)}
        
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
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(28)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
    }
}
