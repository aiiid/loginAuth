//
//  NetworkManager.swift
//  Login Auth training
//
//  Created by Ai Hawok on 05/07/2024.
//

import UIKit
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init(){}
    
    // MARK: - Login Method
    func login(username: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
           let url = "https://lorby.online/api/v1/auth/login"
           let login = Login(username: username, password: password)
           
           AF.request(url,
                      method: .post,
                      parameters: login,
                      encoder: JSONParameterEncoder.default)
           .response { response in
               debugPrint(response)
               if let data = response.data {
                   do {
                       if let httpResponse = response.response, httpResponse.statusCode >= 400 {
                           let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: data)
                           let error = NSError(domain: "", code: errorResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorResponse.message])
                           completion(.failure(error))
                       } else {
                           let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                           completion(.success(loginResponse.accessToken))
                       }
                   } catch {
                       completion(.failure(error))
                   }
               } else {
                   completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
               }
           }
       }
    
    func testLogin() {
        let login = Login(username: "lorby", password: "Lorbyyyy1!")
        
        AF.request("https://lorby.online/api/v1/auth/login",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
    
    // MARK: - Register Method
    func register(username: String, password: String, email: String, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "https://lorby.online/api/v1/auth/register"
        let parameters = Register(username: username, password: password, email: email)
        
        AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoder: JSONParameterEncoder.default
        ).responseData { response in
            guard let statusCode = response.response?.statusCode else {
                let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])
                completion(.failure(error))
                return
            }
            
            if statusCode == 200 {
                if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                    completion(.success(responseString))
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])
                    completion(.failure(error))
                }
            } else {
                if let data = response.data {
                    do {
                        let errorResponse = try JSONDecoder().decode(RegisterErrorResponse.self, from: data)
                        let customError = NSError(domain: "", code: errorResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorResponse.message])
                        completion(.failure(customError))
                    } catch {
                        completion(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: statusCode, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred."])
                    completion(.failure(error))
                }
            }
        }
    }
    
    // MARK: - Example of Authenticated Request
    func getProtectedData(completion: @escaping (Result<Any, Error>) -> Void) {
        guard let token = UserDefaults.standard.string(forKey: "jwtToken") else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "No token found."])
            completion(.failure(error))
            return
        }
        
        let url = "https://yourapi.com/protected"
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(url, headers: headers).validate().responseDecodable(of: LoginResponse.self) { response in
            debugPrint(response)  // This will print the full request and response details
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                if let data = response.data, let jsonString = String(data: data, encoding: .utf8) {
                    print("Response JSON: \(jsonString)")
                }
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
}
