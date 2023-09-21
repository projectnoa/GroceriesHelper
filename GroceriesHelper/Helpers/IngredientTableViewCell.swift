//
//  IngredientTableViewCell.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/3/23.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    static var identifier: String = "ingredientCell"

    @IBOutlet weak var icon: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
