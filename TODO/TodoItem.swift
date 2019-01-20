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
    var subTodos: [String] = []
    var finishedSubTodos: [String] = []
    var progress: Float = 0
    var isDone: Bool = false
    var weight: Float = 0
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getDate() -> String {
        return date
    }
    
    func getWeight() -> Float {
        return weight
    }
    
    
    
    func getSubTodos() -> [String] {
        return subTodos
    }
    
    func getProgress() -> Float {
        return Float(finishedSubTodos.count/subTodos.count)
    }
    
    func getFinishedTodos() -> [String] {
        return finishedSubTodos
    }
    
    func getStatus() -> Bool {
        return isDone
    }
    
}
