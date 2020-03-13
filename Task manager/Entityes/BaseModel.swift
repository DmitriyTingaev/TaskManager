//
//  BaseModel.swift
//  Task manager
//
//  Created by Macbook on 09.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

protocol BaseModel: Codable {}

extension BaseModel {
 
    func toJSON() -> [String: Any]? {
        do {
            let jsonData = try JSONEncoder().encode(self)
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            return json as? [String: Any]
        } catch {
            return nil
        }
    }
        
    internal init?(JSON: [String: Any]) {
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: JSON, options: .fragmentsAllowed)
            let model = try JSONDecoder().decode(Self.self, from: jsonData)
            self = model
        } catch {
            return nil
        }
        
    }
    
}
