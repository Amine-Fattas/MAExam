//
//  HTTPClient.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
    func get(from url: URL, completion: @escaping (Result) -> Void)
}
