//
//  ResponseHanlders.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

protocol ListView : NSObject{
    func updateView()
}

protocol ErrorView : NSObject{
    func showError(error: Error)
}
