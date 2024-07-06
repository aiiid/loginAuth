//
//  EmailView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//

import UIKit
import SnapKit

class EmailView: UIView {
    
    let mainImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "pc"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let mainText: UILabel = {
        var text = UILabel()
        text.font = Constants.Fonts.titleFont
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    let hintText: UILabel = {
        var text = UILabel()
        text.text = """
        Если письмо не пришло, не спеши ждать совиную почту - лучше проверь ящик “Спам”

        (´｡• ω •｡`)
        """
        text.font = Constants.Fonts.lightFont
        text.textAlignment = .center
        text.numberOfLines = 0
        return text
    }()
    
    let loginButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Constants.Colors.primary
        button.layer.cornerRadius = 10
        return button
    }()
    
    let noMailButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Письмо не пришло", for: .normal)
        button.setTitleColor(Constants.Colors.primary, for: .normal)
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
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .white
        
        [
            mainImage,
            mainText,
            hintText,
            loginButton,
            noMailButton
        ].forEach{ addSubview($0)}
        
        mainText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.medium)
            make.centerX.equalToSuperview()
        }
        
        hintText.snp.makeConstraints { make in
            make.top.equalTo(mainText.snp.bottom).inset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.medium)
            make.centerX.equalToSuperview()
        }
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(hintText.snp.bottom).offset(Constants.Padding.medium)
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(94)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.medium)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
        
        noMailButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(Constants.Padding.small)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.medium)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
    }
    
    func setEmailText(_ email: String) {
        mainText.text = "Выслали письмо со ссылкой для завершения регистрации на \(email)"
    }
}
