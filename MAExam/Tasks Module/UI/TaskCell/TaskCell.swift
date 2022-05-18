//
//  TaskCell.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var ul_title: UILabel!
    @IBOutlet weak var ic_completed: UIImageView!
    
    func setup(title: String, completed: Bool){
        ul_title.text = title
        setCheckMark(checked: completed)
    }
    
    private func setCheckMark(checked: Bool){
        let icName = checked ? "checkmark.circle.fill" : "circle"
        ic_completed.image = UIImage(systemName: icName)
    }
    
}
