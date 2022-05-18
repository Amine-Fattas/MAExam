//
//  UsersVC+TestHelpers.swift
//  AcceptanceTests
//
//  Created by Amine Fattas on 18/05/2022.
//

import Foundation
@testable import MAExam

extension UsersVC {
    func numberOfRenderedUsers() -> Int {
        tableView.numberOfRows(inSection: 0)
    }
    
    func renderedUserData(at index: Int) -> NSDictionary {
        let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! UserCell
        let dict = cell.getDictFromModel()
        return dict.toNSDictionary
    }
    
    func simulateTapOnUserItem(at row: Int) {
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: 0)
        delegate?.tableView?(tableView, didSelectRowAt: index)
    }
}
