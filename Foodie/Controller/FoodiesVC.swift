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
    private let realm = try! Realm()
    private lazy var foodies: Results<Food> = { realm.objects(Food.self) }()
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.foodTableView.delegate = self
        self.foodTableView.dataSource = self
    }
    
    //MARK: Private Methods
    private func onFoodieUpdated(foodie: Food) {
        let alertController = UIAlertController(title: "Update Foodie", message: "", preferredStyle: .alert)
        alertController.addTextField { (foodieNameTextField) in
            foodieNameTextField.text = foodie.name
        }
        alertController.addTextField { (foodieOwnerTextField) in
            foodieOwnerTextField.text = foodie.owner
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let foodieNameTextField = alertController.textFields![0] as UITextField
            let foodieOwnerTextField = alertController.textFields![1] as UITextField
            
            guard let foodieName = foodieNameTextField.text, foodieNameTextField.text != "" else { return }
            guard let foodieOwner = foodieOwnerTextField.text, foodieOwnerTextField.text != "" else { return }
            ServiceHelper.shared.updateFoodie(foodie: foodie, newName: foodieName, newOwner: foodieOwner, completion: { (success) in
                if success { self.foodTableView.reloadData() }
            })
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
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
            
            let newFoodie = Food()
            newFoodie.name = foodieName
            newFoodie.owner = foodieOwner
            
            ServiceHelper.shared.addFoodie(foodie: newFoodie, completion: { (success) in
                print("success")
                self.foodTableView.reloadData()
            }, failure: { (failure) in
                print("failed")
            })
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
        return self.foodies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as? FoodCell else { return FoodCell() }
        let foodie = foodies[indexPath.row]
        cell.setupCell(foodie: foodie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            let deletedFoodie = self.foodies[indexPath.row]
            ServiceHelper.shared.deleteFoodie(foodie: deletedFoodie, completion: { (success) in
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }, failure: { (failure) in
                print("cannot delete foodie :(")
            })
        }
        
        let updateAction = UITableViewRowAction(style: .normal, title: "UPDATE") { (rowAction, indexPath) in
            let updatedFoodie = self.foodies[indexPath.row]
            self.onFoodieUpdated(foodie: updatedFoodie)
        }
        return [deleteAction, updateAction]
    }
    
}

