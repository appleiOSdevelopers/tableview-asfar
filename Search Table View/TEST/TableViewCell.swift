//
//  TableViewCell.swift
//  TEST
//
//  Created by Asfar Hussain Siddiqui iOS Lead on 9/5/19.
//  Copyright © 2019 Asfar Hussain Siddiqui iOS Lead. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
