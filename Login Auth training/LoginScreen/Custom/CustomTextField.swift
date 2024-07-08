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
        disableSmartFeatures()
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
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        leftView = paddingView
        leftViewMode = .always
        
        if isPasswordField {
            eyeButton.setImage(UIImage(systemName: "eye.fill"), for: .normal)
            eyeButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .selected)
            eyeButton.tintColor = Constants.Colors.gray
            eyeButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
            
            let rightPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10)) // Smaller width for padding
            let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 40)) // Adjusted width for container view
            
            containerView.addSubview(rightPaddingView)
            containerView.addSubview(eyeButton)
            
            rightPaddingView.snp.makeConstraints { make in
                make.leading.centerY.equalToSuperview()
                make.width.equalTo(10) // Smaller width for padding
                make.height.equalToSuperview()
            }
            
            eyeButton.snp.makeConstraints { make in
                make.leading.equalTo(rightPaddingView.snp.trailing)
                make.trailing.equalToSuperview().inset(10) // Adding inset for spacing
                make.centerY.equalToSuperview()
            }
            
            rightView = containerView
            rightViewMode = .always
        }
    }
    
    private func disableSmartFeatures() {
        autocorrectionType = .no
        spellCheckingType = .no
        smartQuotesType = .no
        smartDashesType = .no
        smartInsertDeleteType = .no
        autocapitalizationType = .none
    }
    
    @objc private func togglePasswordVisibility() {
        isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
}
