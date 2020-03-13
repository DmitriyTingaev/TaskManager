//
//  TaskEditorRouter.swift
//  Task manager
//
//  Created by Macbook on 05.03.2020.
//  Copyright © 2020 Dmitriy Tynhaiev. All rights reserved.
//

import Foundation

class TaskEditorRouter: TaskEditorRouterProtocol {
    
    func close() {
        AppRouter.hidePresentedVC()
    }
    
}
