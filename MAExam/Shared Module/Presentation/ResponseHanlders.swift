//
//  ResponseHanlders.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import Foundation

public protocol ListView : NSObject{
    func updateView()
}

public protocol ErrorView : NSObject{
    func showError(error: Error)
}
