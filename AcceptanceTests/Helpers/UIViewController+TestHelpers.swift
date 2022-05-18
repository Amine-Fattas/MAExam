//
//  UIViewController+TestHelpers.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import UIKit

extension UIViewController {
    func simulateViewWillAppear(){
        loadViewIfNeeded()
        beginAppearanceTransition(true, animated: false)
    }
}
