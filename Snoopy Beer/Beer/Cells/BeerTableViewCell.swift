//
//  BeerTableViewCell.swift
//  Snoopy Beer
//
//  Created by Frederick Dupray on 08/06/2020.
//  Copyright © 2020 SnoopyBeer. All rights reserved.
//

import UIKit
import SDWebImage

class BeerTableViewCell: UITableViewCell {
    //Simplify
    typealias BeerModel = Beer.BeerViewModel
    
    //Easier access to reuseId
    static let reuseIdentifier = "BeerTableViewCell"
    
    //IB references
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var abvLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    //Executed action when favourite button is tapped
    var favouriteButtonTappedAction: ((Bool) -> ())?
    
    //Hard coded values not the cleanest way - but due to time constraints I opted to do it this way
    var isFavourite: Bool = false {
        didSet {
            if self.isFavourite {
                favouriteButton.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
            }
            else {
                favouriteButton.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
            }
        }
    }

    //Send action
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        //Favourite now becomes opposite value
        isFavourite = !isFavourite
        //Send action
        favouriteButtonTappedAction?(!isFavourite)
    }
    
    //Configure cell
    func configure(beerViewModel: BeerModel, favouriteButtonTappedAction: ((Bool) -> ())?) {
        //SDWebImage helper
        beerImageView.sd_setImage(with: URL(string: beerViewModel.beer.image_url), completed: nil)
        beerNameLabel.text = beerViewModel.beer.name
        abvLabel.text = "ABV: \(beerViewModel.beer.abv)%"
        self.isFavourite = beerViewModel.isFavourite
        self.favouriteButtonTappedAction = favouriteButtonTappedAction
    }
}
