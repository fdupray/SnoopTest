//
//  BeerDetailModels.swift
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

enum BeerDetail {
    
    struct BeerModel {
        let name: String
        let descrption: String
        let ingredients: String
        let food_pairings: String
        let imageURL: URL?
    }
  
    enum FetchBeerDetail {
        
        struct Request {
            
        }
        
        struct Response {
            let beerModel: BeerModel
        }
        
        struct ViewModel {
            let beerModel: BeerModel
        }
    }
}