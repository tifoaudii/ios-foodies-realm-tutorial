//
//  ViewController.swift
//  Foodie
//
//  Created by Tifo Audi Alif Putra on 07/07/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit
import RealmSwift

class FoodiesVC: UIViewController {
    
    //MARK: Outlets Here
    @IBOutlet weak var foodTableView: UITableView!
    @IBOutlet weak var infoLabel: UILabel!
    
    //MARK: Properties Here
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodTableView.delegate = self
        self.foodTableView.dataSource = self
    }
    
    //MARK: Action Here
    @IBAction func onAddButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Foodies", message: "Add New Foodie", preferredStyle: .alert)
        alertController.addTextField { (foodieNameTextField) in
            foodieNameTextField.placeholder = "enter foodie name"
        }
        alertController.addTextField { (foodieOwnerTextField) in
            foodieOwnerTextField.placeholder = "enter foodie owner"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let foodieNameTextField = alertController.textFields![0] as UITextField
            let foodieOwnerTextField = alertController.textFields![1] as UITextField
            
            guard let foodieName = foodieNameTextField.text, foodieNameTextField.text != "" else { return }
            guard let foodieOwner = foodieOwnerTextField.text, foodieOwnerTextField.text != "" else { return }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

//MARK: Handle foodTableView's event
extension FoodiesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as? FoodCell else { return FoodCell() }
        return cell
    }
}

