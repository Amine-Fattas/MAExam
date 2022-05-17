//
//  TaskItem.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public struct TaskItem : Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    public init(userId: Int, id: Int, title: String, completed: Bool) {
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
}
