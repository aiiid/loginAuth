//
//  HomeView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 05/07/2024.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let mainImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "globe"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let mainText: UILabel = {
        var text = UILabel()
        text.text = "С возвращением!"
        text.font = Constants.Fonts.titleFont
        text.textAlignment = .center
        return text
    }()
    
    let exitButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Выйти", for: .normal)
        button.tintColor = .white
        button.backgroundColor = Constants.Colors.primaryColor
        button.layer.cornerRadius = 10
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
            exitButton
        ].forEach{ addSubview($0)}
        
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(Constants.Padding.large)
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(94)
        }
        
        mainText.snp.makeConstraints { make in
            make.bottom.equalTo(mainImage.snp.top).offset(Constants.Padding.large)
            make.leading.trailing.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        exitButton.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(Constants.Padding.medium)
            make.height.equalTo(Constants.Size.textFieldHeight)
        }
    }
}
