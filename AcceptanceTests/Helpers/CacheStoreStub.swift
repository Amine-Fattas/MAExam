//
//  CacheStoreStub.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation
import MAExam

class CacheStoreStub {
    private(set) var cache: Data?

    private init(cache: Data? = nil) {
        self.cache = cache
    }
}

extension CacheStoreStub: CacheStore {
    func save(data: Data, KEY: String) {
        self.cache = data
    }

    func load(KEY: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let cache = cache {
            completion(.success(cache))
        }
        else {
            completion(.failure(NSError(domain: "Empty", code: 404)))
        }
    }
}

extension CacheStoreStub {
    static var empty: CacheStoreStub {
        CacheStoreStub()
    }
}
