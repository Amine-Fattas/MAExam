//
//  CacheStore.swift
//  MAExam
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation

protocol CacheStore {
    func save(data: Data, KEY: String)
    func load(KEY: String, completion: @escaping (Result<Data, Error>) -> Void)
}
