//
//  PasswordMatchCheckerView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//

import UIKit

class PasswordMatchCheckerView: UIView {
    private let matchLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(matchLabel)
        matchLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        matchLabel.textAlignment = .left
        matchLabel.text = "Пароли должны совпадать"
        matchLabel.font = .systemFont(ofSize: 13, weight: .light)
        matchLabel.textColor = Constants.Colors.gray
    }
    
    func updateMatch(isMatch: Bool) {
        matchLabel.textColor = isMatch ? Constants.Colors.green : .red
        matchLabel.text = isMatch ? "✅" : "Пароли должны совпадать"
    }
}
