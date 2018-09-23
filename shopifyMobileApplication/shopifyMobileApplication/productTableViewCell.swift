//
//  productTableViewCell.swift
//  shopifyMobileApplication
//
//  Created by Kashturi V on 2018-09-17.
//  Copyright © 2018 Kashturi V. All rights reserved.
/**  Purpose of class productTableViewCell
     This class is used to connect the items that
     appear on the Products screen to the code, this
     class is referenced in the products view controller.
 */

import UIKit

class productTableViewCell: UITableViewCell {

    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var productlbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
