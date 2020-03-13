//
//  BaseError.swift
//  Task manager
//
//  Created by Macbook on 10.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class BaseError: Error, LocalizedError {
    
    var title: String?
    var errorDescription: String?
    
    init(response: [String: Any]) {
        
        title = response["message"] as? String
        var description = [String]()
        
        if let fields = response["fields"] as? [String: Any] {
            for field in fields {
                let key = field.key
                let val = fields[key] as? [String]
                description.append("\(key): \(val!.joined())")
            }
        }
        
        errorDescription = NSLocalizedString(description.joined(separator: "\n"), comment: title ?? "Error")
    }
        
}
