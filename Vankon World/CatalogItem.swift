//
//  CatalogItem.swift
//  Vankon World
//
//  Created by Rohit Gurnani on 14/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import Foundation

class CatalogItem {
    var title = ""
    var isSubCategory = false
    
    required init(title : String , isSubCategory : Bool)
    {
        self.title = title
        self.isSubCategory = isSubCategory
    }
}
