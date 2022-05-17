//
//  TasksInteractor.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

protocol TasksInteractor {
    func load(completion: @escaping (Result<[TaskItem], Error>) -> Void)
}
