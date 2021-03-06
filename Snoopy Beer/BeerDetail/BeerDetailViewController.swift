//
//  BeerDetailViewController.swift
//  Snoopy Beer
//
//  Created by Frederick Dupray on 08/06/2020.
//  Copyright (c) 2020 SnoopyBeer. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol BeerDetailDisplayLogic: class {
    func displayBeer(viewModel: BeerDetail.FetchBeerDetail.ViewModel)
}

class BeerDetailViewController: UIViewController, BeerDetailDisplayLogic {
    
    var interactor: BeerDetailBusinessLogic?
    var router: (NSObjectProtocol & BeerDetailRoutingLogic & BeerDetailDataPassing)?
  
    //IB
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerDescriptionLabel: UILabel!
    @IBOutlet weak var ingredientsListLabel: UILabel!
    @IBOutlet weak var foodPairingsListLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBeer()
    }

    func fetchBeer() {
        interactor?.fetchBeerDetail(request: BeerDetail.FetchBeerDetail.Request())
    }
    
    func displayBeer(viewModel: BeerDetail.FetchBeerDetail.ViewModel) {
        
        let beerModel = viewModel.beerModel
        
        beerImageView.sd_setImage(with: beerModel.imageURL, completed: nil)
        beerNameLabel.text = beerModel.name
        beerDescriptionLabel.text = beerModel.descrption
        ingredientsListLabel.text = beerModel.ingredients
        foodPairingsListLabel.text = beerModel.food_pairings
    }
}

extension BeerDetailViewController {
    
    private func setup() {
        let viewController = self
        let interactor = BeerDetailInteractor()
        let presenter = BeerDetailPresenter()
        let router = BeerDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
