//
//  DishCollectionViewCell.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/3/23.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {
    
    static var identifier: String = "dishCell"

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
