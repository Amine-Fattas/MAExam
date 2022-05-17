//
//  UserViewModel.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

struct UserItem: Decodable{
    let id: Int
    let name: String
    let username: String
    let email: String
}
