//
//  NetworkService.swift
//  Task manager
//
//  Created by Macbook on 06.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class NetworkService {
    
    private var sessionService = SessionService.shared()
    private let baseURL = "https://testapi.doitserver.in.ua/api"
    
    private static var sharedNetworkService: NetworkService = {
        return NetworkService()
    }()
    
    class func shared() -> NetworkService {
        return sharedNetworkService
    }
    
    private init() {}
    
    
    func makeRequest(
        
        path: String,
        method: HTTPMethod,
        params: [String: Any]?,
        success: @escaping ([String: Any]) -> (),
        failure: @escaping (Error) -> ()
        
    ) {
        
        guard let token = sessionService.getToken() else {
            AppRouter.presentLoginScreen()
            return
        }
        
        var request = prepareRequest(path: path, method: method, params: params)
        request.addValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.sync {
             
                if let error = error {
                    failure(error)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    do {
                        let JSON = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
                        if NetworkErrorService.shared().hasError(code: response.statusCode) {
                            failure(BaseError(response: JSON!))
                        } else {
                            success(JSON ?? [:])
                        }
                    } catch {
                        failure(error)
                    }
                }
                
            }
        }.resume()
        
    
    }
    

    func prepareRequest(path: String, method: HTTPMethod, params: [String: Any]?) -> URLRequest {
        
        var urlComponent = URLComponents(string: baseURL + path)
        urlComponent?.queryItems = params?.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        
        var request = URLRequest(url: (urlComponent?.url)!)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    
    }
    
    private func prepareParams(params: [String: Any]) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: params, options: .fragmentsAllowed)
        } catch {
            return nil
        }
    }

    
}

extension NetworkService {
    
    enum HTTPMethod: String {
        
        case put        = "PUT"
        case get        = "GET"
        case post       = "POST"
        case delete     = "DELETE"
        
    }
    
}
