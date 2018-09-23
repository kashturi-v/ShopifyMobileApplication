//
//  tagsListCell.swift
//  shopifyMobileApplication
//
//  Created by Kashturi V on 2018-09-16.
//  Copyright © 2018 Kashturi V. All rights reserved.
/**  Purpose of class tagsListCell
     This class is used to connect the items that
     appear on the Tags screen to the code, this
     class is referenced in the tags view controller.
 */


import UIKit

class tagsListCell: UITableViewCell {

    @IBOutlet weak var numOfProdLbl: UILabel!
    @IBOutlet weak var tagLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
