//
//  LoginView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//

import UIKit
import SnapKit

class SplashView: UIView {
    
    let mainImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "mainScreen"))
        return image
    }()
    
    let mainText: UILabel = {
        var text = UILabel()
        text.text = "Lorby"
        text.font = Constants.Fonts.titleFont
        text.textAlignment = .center
        return text
    }()
    
    let secondaryText: UILabel = {
        var text = UILabel()
        text.text = "Твой личный репетитор"
        text.font = Constants.Fonts.bodyFont
        text.textAlignment = .center
        return text
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
        addSubview(mainImage)
        addSubview(mainText)
        addSubview(secondaryText)
        
        mainImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        mainText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide).offset(118)
            make.leading.trailing.equalToSuperview().inset(51)
        }
        
        secondaryText.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainText.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(51)
        }
        
    }
}
