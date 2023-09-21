//
//  DishCollectionController.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/3/23.
//

import UIKit

class DishCollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var dishCollectionView: UICollectionView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Dishes"
        
        dishCollectionView.dataSource = self
        dishCollectionView.delegate = self
        
        dishCollectionView.register(UINib(nibName: "DishCollectionViewCell",
                                          bundle: .main),
                                    forCellWithReuseIdentifier: DishCollectionViewCell.identifier)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishCollectionViewCell.identifier, for: indexPath) as! DishCollectionViewCell

        cell.image.image = UIImage(systemName: "star")
        cell.title.text = "Test"
        cell.desc.text = "cell \(indexPath.row)"
        
        return cell
    }
    
    @IBAction func onAddClick(_ sender: UIBarButtonItem) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
