//
//  SceneDelegate+TestHelpers.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import UIKit
@testable import MAExam

extension SceneDelegate {
    convenience init(httpClient: HTTPClient, cacheStore: CacheStore) {
        self.init()
        self.httpClient = httpClient
        self.cacheStore = cacheStore
    }
}
