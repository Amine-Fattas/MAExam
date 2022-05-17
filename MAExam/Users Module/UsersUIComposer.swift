//
//  UsersUIComposer.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UsersUIComposer {
    static func compose(onUserSelection: @escaping (Int) -> Void) -> UIViewController{
        let presenter = UsersPresenter(onUserSelection: { userId in
            onUserSelection(userId)
        })
        let vc = UsersVC(presenter: presenter, nibName: "UsersVC", bundle: nil)
        return vc
    }
}
