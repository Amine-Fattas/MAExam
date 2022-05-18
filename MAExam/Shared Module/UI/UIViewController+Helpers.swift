//
//  UIViewController+Helpers.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

extension UIViewController {
    public func showAlert(error: Error, onDismiss: @escaping () -> Void){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
            onDismiss()
        }))
        present(alert, animated: true)
    }
}
