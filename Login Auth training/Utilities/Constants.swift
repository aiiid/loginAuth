//
//  Constants.swift
//  Login Auth training
//
//  Created by Ai Hawok on 04/07/2024.
//

import UIKit

struct Constants {
    struct Padding {
            static let small: CGFloat = 16
            static let medium: CGFloat = 20
            static let large: CGFloat = 25
        }
    
    struct Size {
            static let textFieldHeight: CGFloat = 50
        }
    
    struct Colors {
        static let primary = UIColor(hex: "#292929")
        static let backgroundColor = UIColor.systemBackground
        static let green = UIColor(hex: "#1BA228")
        static let gray: UIColor = .systemGray6
        static let textColor = UIColor.label
    }
    
    struct Fonts {
        static let titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        static let bodyFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}

