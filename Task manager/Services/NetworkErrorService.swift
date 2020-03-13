//
//  NetworErrorService.swift
//  Task manager
//
//  Created by Macbook on 10.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class NetworkErrorService {
    
    private static var networkErrorService = NetworkErrorService()
    
    class func shared() -> NetworkErrorService {
        return networkErrorService
    }

    func hasError(code: Int) -> Bool {
        let allCodes = StatusCode.allCases.map { $0.rawValue }
        return allCodes.contains(code)
    }
        
}

extension NetworkErrorService {
    
    enum StatusCode: Int, CaseIterable {
        case validateError = 422
        case wrongCredentials = 402
    }
    
}
