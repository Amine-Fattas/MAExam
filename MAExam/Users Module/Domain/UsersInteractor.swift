//
//  UsersInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public protocol UsersInteractor {
    func load(completion: @escaping (Result<[UserItem], Error>) -> Void)
}
