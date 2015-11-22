//
//  CatalogTableViewController.swift
//  Vankon World
//
//  Created by Rohit Gurnani on 12/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {
    //var catalogLists : [CatalogItem]
    var image : UIImage?
    
//    required init(coder aDecoder: NSCoder) {
//        catalogLists = [CatalogItem]()
//        
//        var catalogSingleItem = CatalogItem(title: "Krio" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Krio Switches" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Krio Plates" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Smart Series" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Modular" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Modular Switches" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Modular Plates" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Four Wooden Plates" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Woody Plates" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//
//        catalogSingleItem = CatalogItem(title: "Nano Plates" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Mod Surface Box" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "MM" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "MM Plates" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//
//        catalogSingleItem = CatalogItem(title: "MM Switches" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "MM Cover Frames" , isSubCategory: true)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Ashwaa Plus" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Ashwaa" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "MCB" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        catalogSingleItem = CatalogItem(title: "Ding Dong Bell" , isSubCategory: false)
//        catalogLists.append(catalogSingleItem)
//        
//        super.init(coder: aDecoder)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    @IBAction func showCatalogBtnTapped(sender: AnyObject) {
        performSegueWithIdentifier("showPdf", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPdf"
        {
            let vc = segue.destinationViewController as! PDFViewController
           // vc.isPdf = true
        }
        
    }
    
    func createSnapshot()
    {
        //creating the image. first step getting size
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
