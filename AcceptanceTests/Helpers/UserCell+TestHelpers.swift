//
//  UserCell+TestHelpers.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation
@testable import MAExam

extension UserCell {
     func getDictFromModel() -> [String: Any]{
        [
            "name": ul_name.text ?? "",
            "username": ul_username.text ?? "",
            "email": ul_email.text ?? "",
        ]
    }
}
