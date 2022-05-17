//
//  UserCell.swift
//  MAExam
//
//  Created by Amine Fattas on 17/05/2022.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - Outlets -
    @IBOutlet weak var ul_name: UILabel!
    @IBOutlet weak var ul_username: UILabel!
    @IBOutlet weak var ul_email: UILabel!
    
    @IBOutlet weak var uv_container: UIView!
    
    //MARK: - init methods -
    override func awakeFromNib() {
        super.awakeFromNib()
        initUI()
    }
    
    private func initUI(){
        uv_container.layer.borderWidth = 1
        uv_container.layer.borderColor = UIColor.orange.cgColor
        uv_container.layer.cornerRadius = 5
        ul_name.layer.cornerRadius = 5
        ul_name.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
