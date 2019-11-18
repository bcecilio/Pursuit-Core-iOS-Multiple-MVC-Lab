//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var animals = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animals = [ZooAnimal.zooAnimals]
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let AnimalDetailController = segue.destination as? AnimalDetailController, let indexPath = tableView.indexPathForSelectedRow else {
            return
        }
        AnimalDetailController.animals = animals[indexPath.section][indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
            // explicitly crashes the app at runtime if a CountryCell does not exist
            // this is a developer error
            fatalError("coudn't dequeue a CountryCell")
        }
        
        let animal = animals[indexPath.section][indexPath.row]
        
        cell.configureCell(for: animal)
        
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animals[section].first?.classification
    }
}
