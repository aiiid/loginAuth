//
//  PasswordCheckerView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//

import UIKit

class PasswordCheckerView: UIView {
    private let lengthLabel = UILabel()
    private let lowercaseLabel = UILabel()
    private let uppercaseLabel = UILabel()
    private let numberLabel = UILabel()
    private let specialCharacterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        let stackView = UIStackView(arrangedSubviews: [lengthLabel, lowercaseLabel, uppercaseLabel, numberLabel, specialCharacterLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        lengthLabel.text = "От 8 до 15 символов "
        lowercaseLabel.text = "Строчные и прописные буквы"
        uppercaseLabel.text = "Минимум 1 цифра"
        numberLabel.text = "At least one number"
        specialCharacterLabel.text = """
Минимум 1 спецсимвол (!, ", #, $...)
"""
        
        resetLabels()
    }
    
    private func resetLabels() {
        [lengthLabel, lowercaseLabel, uppercaseLabel, numberLabel, specialCharacterLabel].forEach {
            $0.textColor = Constants.Colors.gray
            $0.font = .systemFont(ofSize: 13, weight: .light)
        }
    }
    
    func update(with result: RegistrationViewModel.PasswordValidationResult) {
        let green = Constants.Colors.green
        let gray = Constants.Colors.gray
        lengthLabel.textColor = result.length ? green : gray
        lowercaseLabel.textColor = result.lowercase ? green : gray
        uppercaseLabel.textColor = result.uppercase ? green : gray
        numberLabel.textColor = result.number ? green : gray
        specialCharacterLabel.textColor = result.specialCharacter ? green : gray
    }
}

