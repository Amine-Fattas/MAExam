//
//  UserViewModel.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public struct UserItem: Decodable{
    public let id: Int
    public let name: String
    public let username: String
    public let email: String
}
