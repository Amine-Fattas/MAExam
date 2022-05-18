//
//  RemoteUsersInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public class RemoteUsersInteractor : UsersInteractor{
    
    private let httpClient: HTTPClient
    private let urlString : String
    
    public init(httpClient: HTTPClient, urlString : String){
        self.httpClient = httpClient
        self.urlString  = urlString
    }
    
    
    public func load(completion: @escaping (Result<[UserItem], Error>) -> Void){
        
        guard let url = URL(string: urlString) else { return }
        httpClient.get(from: url, completion: { result in
            switch result {
                
            case let .success((data, response)):
                if response.statusCode == 200{
                    do {
                        let users = try JSONDecoder().decode([UserItem].self, from: data)
                        completion(.success(users))
                    }
                    catch {
                        completion(.failure(NSError(domain: "Invalid Data", code: 0)))
                    }
                } else {
                    completion(.failure(NSError(domain: "Not successful", code: 0)))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }
}
