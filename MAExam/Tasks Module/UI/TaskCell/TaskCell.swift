//
//  TaskCell.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var ul_title: UILabel!
    @IBOutlet weak var sw_completed: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    private func initUI(){
        sw_completed.isUserInteractionEnabled = false
    }
    
    func setup(title: String, completed: Bool){
        ul_title.text = title
        sw_completed.isOn = completed
    }
    
}
