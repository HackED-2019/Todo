//
//  TodoItem.swift
//  TODO
//
//  Created by Kevin Zhang on 2019-01-19.
//  Copyright © 2019 Kaiwen Zhang. All rights reserved.
//

import Foundation

class TodoItem {
    var title: String
    var date: String
    var subTodos: [String]
    
    init(title: String, date: String, subTodos: [String]) {
        self.title = title
        self.date = date
        self.subTodos = subTodos
    }
}
