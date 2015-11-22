//
//  NavMenuTableViewController.swift
//  Vankon World
//
//  Created by Rohit Gurnani on 11/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class NavMenuTableViewController: UITableViewController {
    
    let menuArray : [String] = ["Home" ,"About Us", "Catalog", "Videos" , "Social Media" , "Latest Offers" , "Credits"]
    let segueArray : [String] = ["showHome" , "showAboutUs" , "showCatalog" , "showVideos" , "showSocialMedia" , "showLatestOffers" , "showCredits"]
    var backgroundImage : UIImage?
    var rowHeight : CGFloat?
    var selectedIndexPath : NSIndexPath?
    var previouslySelectedIndexPath : NSIndexPath?

    override func viewWillAppear(animated: Bool) {
        
        if (!UIAccessibilityIsReduceTransparencyEnabled()) {
            tableView.backgroundColor = UIColor.clearColor()

            let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            tableView.backgroundView = blurEffectView
            self.view.backgroundColor = UIColor(patternImage: backgroundImage!)
            rowHeight = self.view.frame.height
            
            tableView.separatorEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
        }
        
    }
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

    // MARK: - Table view data source

    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        print("num of rows called")
      //  return menuArray.count
        return menuArray.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.rowHeight = rowHeight! / CGFloat(menuArray.count)
        let cell = tableView.dequeueReusableCellWithIdentifier("ClearCell", forIndexPath: indexPath) 
        let label = cell.viewWithTag(100) as! UILabel
        label.text = menuArray[indexPath.row]
        //label.text = "hi"
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //var view : UIView = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        cell.backgroundColor = UIColor.clearColor()
        (cell.viewWithTag(100) as! UILabel).textColor = UIColor.whiteColor()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let psip = selectedIndexPath{
            previouslySelectedIndexPath = psip
            print("reached here")
            let oldCell = tableView.cellForRowAtIndexPath(previouslySelectedIndexPath!)
            let oldLabel = oldCell?.viewWithTag(100) as! UILabel
            oldLabel.font = UIFont(name: "AvenirNext-UltraLight", size: 30.0)
        }
        print("didnt go there")
       // tableView.reloadData()
        selectedIndexPath = indexPath
        let cell = tableView.cellForRowAtIndexPath(selectedIndexPath!)
        let label = cell?.viewWithTag(100) as! UILabel
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 30.0)
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if indexPath.row == 0
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
        
        performSegueWithIdentifier(segueArray[indexPath.row], sender: nil)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
