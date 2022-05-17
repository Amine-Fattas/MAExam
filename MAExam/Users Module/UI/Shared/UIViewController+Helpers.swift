//
//  UIViewController+Helpers.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

extension UIViewController {
    func showAlert(error: Error){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
