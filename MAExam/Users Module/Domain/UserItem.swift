//
//  UserViewModel.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public struct UserItem: Codable{
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
    
    public init(id: Int, name: String, username: String, email: String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
    }
}
