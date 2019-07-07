//
//  ViewController.swift
//  Foodie
//
//  Created by Tifo Audi Alif Putra on 07/07/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class FoodiesVC: UIViewController {
    
    //MARK: Outlets Here
    @IBOutlet weak var foodTableView: UITableView!
    
    //MARK: Properties Here
    private var foodies = [Food]()
    
    //MARK: ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

//MARK: Handle foodTableView's event
extension FoodiesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "food_cell", for: indexPath) as? FoodCell else { return FoodCell() }
        return cell
    }
    
    
}

