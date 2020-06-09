//
//  BeerDetailInteractor.swift
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

protocol BeerDetailBusinessLogic {
    func fetchBeerDetail(request: BeerDetail.FetchBeerDetail.Request)
}

protocol BeerDetailDataStore {
    var beer: BeerDetail.BeerModel? { get set }
}

class BeerDetailInteractor: BeerDetailBusinessLogic, BeerDetailDataStore {
    
    var presenter: BeerDetailPresentationLogic?
    
    var beer: BeerDetail.BeerModel?
  
    func fetchBeerDetail(request: BeerDetail.FetchBeerDetail.Request) {
        
        guard let model = beer else {
            return
        }
      
        let response = BeerDetail.FetchBeerDetail.Response(beerModel: model)
        presenter?.presentBeer(response: response)
    }
}