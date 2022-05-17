//
//  URLSessionHTTPClient.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public final class URLSessionHTTPClient : HTTPClient {
    private let session = URLSession.shared

    public init() {}

    public typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    private struct UnexpectedValuesRepresentation: Error {}

    public func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
        let task = session.dataTask(with: url) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
        task.resume()
    }
}
