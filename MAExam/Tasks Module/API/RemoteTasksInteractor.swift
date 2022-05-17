//
//  RemoteTasksInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

class RemoteTasksInteractor : TasksInteractor{
    
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient){
        self.httpClient = httpClient
    }
    
    
    public func load(completion: @escaping (Result<[TaskItem], Error>) -> Void){
        
        let urlString = "https://jsonplaceholder.typicode.com/users/"
        guard let url = URL(string: urlString) else { return }
        httpClient.get(from: url, completion: { result in
            switch result {
                
            case let .success((data, response)):
                if response.statusCode == 200{
                    do {
                        let tasks = try JSONDecoder().decode([TaskItem].self, from: data)
                        completion(.success(tasks))
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
