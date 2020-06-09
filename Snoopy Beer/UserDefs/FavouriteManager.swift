//
//  FavouriteManager.swift
//  Snoopy Beer
//
//  Created by Frederick Dupray on 08/06/2020.
//  Copyright © 2020 SnoopyBeer. All rights reserved.
//

import Foundation

protocol Favouritable {
    var favouriteManager: FavouriteManager { get set }
}

class FavouriteManager: NSObject {
    
    fileprivate let userDefs = UserDefaults()

    func isFavourite(id: String) -> Bool {
        return userDefs.bool(forKey: id)
    }
    
    func addToFavourites(id: String) {
        userDefs.set(true, forKey: id)
    }
    
    func removeFromFavourites(id: String) {
        userDefs.removeObject(forKey: id)
    }
}
