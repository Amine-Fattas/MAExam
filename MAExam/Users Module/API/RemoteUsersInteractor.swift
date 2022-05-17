//
//  RemoteUsersInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class RemoteUsersInteractor {
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient){
        self.httpClient = httpClient
    }
    
    
    public func load(completion: @escaping (Result<[UserItem], Error>) -> Void){
        
        let urlString = "https://jsonplaceholder.typicode.com/users/"
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


let users = [
    UserItem(id: 0, name: "a name", username: "an username", email: "an email"),
    UserItem(id: 1, name: "a name", username: "an username", email: "an email"),
    UserItem(id: 2, name: "a name", username: "an username", email: "an email"),
    UserItem(id: 3, name: "a name", username: "an username", email: "an email"),
    UserItem(id: 4, name: "a name", username: "an username", email: "an email"),
    UserItem(id: 5, name: "a name", username: "an username", email: "an email"),
]
