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
    var finishedTodos: [String] = []
    var progress: Float = 0

    init(title: String, date: String, subTodos: [String]) {
        self.title = title
        self.date = date
        self.subTodos = subTodos
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDate() -> String {
        return date
    }
    
    func getSubTodos() -> [String] {
        return subTodos
    }
    
    func getProgress() -> Float {
        return Float(finishedTodos.count/subTodos.count)
    }
    
    func getFinishedTodos() -> [String] {
        return finishedTodos
    }
    
}
