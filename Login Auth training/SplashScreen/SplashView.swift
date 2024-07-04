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
        
        mainImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
