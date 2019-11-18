//
//  AnimalDetailController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Brendon Cecilio on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDetailController: UIViewController {
    
    var animals: ZooAnimal?
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalDescriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        animalImageView.image = UIImage(named: (animals?.imageNumber)?.description ?? "")
        animalDescriptionLabel.text = animals?.info
        title = animals?.name
    }

}
