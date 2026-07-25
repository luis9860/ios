//
//  TableCustomTableViewCell.swift
//  UICibertec
//
//  Created by Marcelo Stefano Velasquez Herrera on 22/07/26.
//

import UIKit

class TableCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
