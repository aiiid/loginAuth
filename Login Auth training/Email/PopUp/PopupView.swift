//
//  PopupView.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//
import UIKit
import SnapKit

class PopupView: UIView {
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Your trip booked!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    var messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ok", for: .normal)
        button.backgroundColor = Constants.Colors.primary
        button.tintColor = .white
        button.layer.cornerRadius = 15
        return button
    }()
    
    let verticalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        addSubview(containerView)
        
        containerView.addSubview(verticalStack)
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(messageLabel)
        verticalStack.addArrangedSubview(submitButton)
        
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(250)
        }
        
        verticalStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
        
        submitButton.snp.makeConstraints { make in
            make.height.equalTo(44)
        }
    }
}
