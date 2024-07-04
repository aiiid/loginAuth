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
        configureTextField(isPasswordField: isPasswordField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField(isPasswordField: Bool) {
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray
        ]
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "", attributes: placeholderAttributes)
        borderStyle = .roundedRect
        
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
