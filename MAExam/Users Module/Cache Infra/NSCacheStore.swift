//
//  NSCacheStore.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class NSCacheStore : CacheStore {
    
    private let cache: NSCache<NSString, NSData>
    
    init(cache: NSCache<NSString, NSData>){
        self.cache = cache
    }
    
    func save(data: Data, KEY: String) {
        cache.setObject(NSData(data: data), forKey: NSString(string: KEY))
    }
    
    func load(KEY: String, completion: @escaping (Result<Data, Error>) -> Void) {
        if let nsData = cache.object(forKey: NSString(string: KEY)){
            let data = Data(referencing: nsData)
            completion(.success(data))
        }
        else {
            completion(.failure(NSError(domain: "Cannot load users", code: 404)))
        }
    }
}
