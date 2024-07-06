//
//  RegistrationViewModel.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//

import Foundation

class RegistrationViewModel {
    enum PasswordCheck {
        case length
        case lowercase
        case uppercase
        case number
        case specialCharacter
    }
    
    struct PasswordValidationResult {
        var length: Bool
        var lowercase: Bool
        var uppercase: Bool
        var number: Bool
        var specialCharacter: Bool
    }
    
    var passwordValidationResult: ((PasswordValidationResult) -> Void)?
    
    func validate(password: String) {
        let length = password.count >= 8 && password.count <= 15
        let lowercase = password.range(of: "[a-z]", options: .regularExpression) != nil
        let uppercase = password.range(of: "[A-Z]", options: .regularExpression) != nil
        let number = password.range(of: "[0-9]", options: .regularExpression) != nil
        let specialCharacter = password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
        
        let result = PasswordValidationResult(
            length: length,
            lowercase: lowercase,
            uppercase: uppercase,
            number: number,
            specialCharacter: specialCharacter
        )
        
        passwordValidationResult?(result)
    }
}
