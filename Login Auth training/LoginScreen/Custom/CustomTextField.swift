//
//  CustomTextField.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//

import UIKit

class CustomTextField: UITextField {
    
    private let eyeButton = UIButton(type: .custom)
    
    init(placeholder: String, isPasswordField: Bool) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = isPasswordField
        self.textContentType = isPasswordField ? .oneTimeCode : .none
        configureTextField(isPasswordField: isPasswordField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField(isPasswordField: Bool) {
            let placeholderAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.lightGray
            ]
            attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: placeholderAttributes)
            
            borderStyle = .none
            backgroundColor = UIColor.systemGray6
            layer.cornerRadius = 10
            layer.masksToBounds = true
            
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 40))
            leftView = paddingView
            leftViewMode = .always
            
            if isPasswordField {
                eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
                eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
                eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
                rightView = eyeButton
                rightViewMode = .always
            }
        }
    
    @objc private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
