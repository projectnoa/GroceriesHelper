//
//  ViewController.swift
//  GroceriesHelper
//
//  Created by Juan Reyes on 9/3/23.
//

import UIKit

class HomeController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var groceriesTableView: UITableView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var data: [Item]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Groceries"
        
        groceriesTableView.dataSource = self
        groceriesTableView.delegate = self
        
        groceriesTableView.register(UINib(nibName: "IngredientTableViewCell",
                                            bundle: .main),
                                      forCellReuseIdentifier: IngredientTableViewCell.identifier)
        
        loadData()
    }
    
    func loadData() {
        Task {
            data = await NetworkManager.shared.get(.groceries)
            
            groceriesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientTableViewCell.identifier, for: indexPath) as! IngredientTableViewCell
        
        guard let item = data?[indexPath.row] as? Item else {
            return cell
        }
        
        cell.title.text = item.title
        cell.location.text = item.locations?.first?.title ?? " - "
        cell.amount.text = item.amount
        cell.icon.image = UIImage(systemName: "star")
        
        return cell
    }

    @IBAction func onAddClicked(_ sender: UIBarButtonItem) {
        print("add pressed!")
    }
}

