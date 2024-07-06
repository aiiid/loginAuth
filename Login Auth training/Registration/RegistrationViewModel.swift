//
//  RegistrationViewModel.swift
//  Login Auth training
//
//  Created by Ai Hawok on 06/07/2024.
//

struct Register: Encodable {
    let username: String
    let password: String
    let email: String
}
struct RegisterErrorResponse: Decodable {
    let path: String
    let message: String
    let statusCode: Int
    let timestamp: String
}

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
    
    // MARK: - Password validity check
    
    var passwordValidationResult: ((PasswordValidationResult) -> Void)?
    var passwordMatchResult: ((Bool) -> Void)?
    var allChecksValidResult: ((Bool) -> Void)?
    
    
    private var passwordValidation = PasswordValidationResult(length: false, lowercase: false, uppercase: false, number: false, specialCharacter: false)
    private var passwordsMatch = false
    
    func validate(password: String) {
        let length = password.count >= 8 && password.count <= 15
        let lowercase = password.range(of: "[a-z]", options: .regularExpression) != nil
        let uppercase = password.range(of: "[A-Z]", options: .regularExpression) != nil
        let number = password.range(of: "[0-9]", options: .regularExpression) != nil
        let specialCharacter = password.range(of: "[^A-Za-z0-9]", options: .regularExpression) != nil
        
        passwordValidation = PasswordValidationResult(
            length: length,
            lowercase: lowercase,
            uppercase: uppercase,
            number: number,
            specialCharacter: specialCharacter
        )
        
        passwordValidationResult?(passwordValidation)
        checkAllValidations()
    }
    
    func validatePasswordMatch(password: String?, confirmPassword: String?) {
        passwordsMatch = password == confirmPassword
        passwordMatchResult?(passwordsMatch)
        checkAllValidations()
    }
    
    private func checkAllValidations() {
        let allValid = passwordValidation.length &&
        passwordValidation.lowercase &&
        passwordValidation.uppercase &&
        passwordValidation.number &&
        passwordValidation.specialCharacter &&
        passwordsMatch
        allChecksValidResult?(allValid)
    }
    
    // MARK: - Registration
    var registrationResult: ((Result<String, Error>) -> Void)?
    
    func validateCredentials(username: String?, password: String?, email: String?, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let username = username, !username.isEmpty,
              let password = password, !password.isEmpty,
              let email = email, !email.isEmpty else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "All fields are required."])
            completion(.failure(error))
            return
        }
        
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
            
            if !emailPredicate.evaluate(with: email) {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Please enter a valid email address."])
                completion(.failure(error))
                return
            }
        completion(.success(()))
    }
    
    func register(username: String, password: String, email: String) {
        NetworkManager.shared.register(username: username, password: password, email: email) { [weak self] result in
            self?.registrationResult?(result)
        }
    }
}
