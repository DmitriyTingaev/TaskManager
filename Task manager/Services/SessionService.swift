//
//  SessionService.swift
//  Task manager
//
//  Created by Macbook on 10.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class SessionService {
    
    private var token: String?
    
    private static var sessionService = SessionService()
    
    class func shared() -> SessionService {
        return sessionService
    }

    func getToken() -> String? {
        return token
    }
        
    func authorize(path: SessionPath, email: String, password: String, success: @escaping ()->(), failure: @escaping (Error) -> ()) {
        let params = ["email": email, "password": password]
        let request = NetworkService.shared().prepareRequest(path: path.rawValue, method: .post, params: params)
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
             
                if let error = error {
                    failure(error)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                        if NetworkErrorService.shared().hasError(code: response.statusCode) {
                            failure(BaseError(response: JSON))
                        } else {
                            self.token = JSON["token"] as? String
                            success()
                        }
                    } catch {
                        failure(error)
                    }
                }
                
            }
        }.resume()
        
    }
    
}

extension SessionService {
    
    enum SessionPath: String {
        case auth = "/auth"
        case register = "/users"
    }
    
}
