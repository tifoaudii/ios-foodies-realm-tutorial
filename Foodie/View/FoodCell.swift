//
//  FoodCell.swift
//  Foodie
//
//  Created by Tifo Audi Alif Putra on 07/07/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

    //MARK: Outlets Here
    @IBOutlet weak var foodieName: UILabel!
    @IBOutlet weak var foodieOwner: UILabel!
    
    //MARK: View lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //Setup Cell's Content
    func setupCell(foodie: Food) {
        self.foodieName.text = foodie.name
        self.foodieOwner.text = foodie.owner
    }
}
