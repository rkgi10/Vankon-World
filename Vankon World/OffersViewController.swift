//
//  OffersViewController.swift
//  Vankon World
//
//  Created by Rohit Gurnani on 31/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showOffers(sender: AnyObject) {
        performSegueWithIdentifier("showLatestOffersWeb", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLatestOffersWeb" {
            let vc = segue.destinationViewController as! WebsiteViewController
            vc.isOffers = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
