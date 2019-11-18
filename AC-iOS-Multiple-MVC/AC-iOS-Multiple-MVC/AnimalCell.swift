//
//  AnimalCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Brendon Cecilio on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalLocationLabel: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func configureCell(for animal: ZooAnimal) {
        animalImageView.image = UIImage(contentsOfFile: String(animal.imageNumber))
        animalNameLabel.text = animal.name
        animalLocationLabel.text = animal.origin
    }
    
}
