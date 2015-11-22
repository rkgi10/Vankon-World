//
//  HomePageViewController.swift
//  Vankon World
//
//  Created by Rohit Gurnani on 11/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit
import MessageUI

class HomePageViewController: UIViewController , MFMailComposeViewControllerDelegate {
    
    var gif : NSData?
    var image : UIImage?
    @IBOutlet weak var backgroundWebView: UIWebView!
    @IBAction func callCustomerCare(sender: AnyObject) {
        
        let phone = "tel://+9102232421258"
        let phoneURL = NSURL(string: phone)
        UIApplication.sharedApplication().openURL(phoneURL!)
    }
    
    func getgif()
    {
           let filePath = NSBundle.mainBundle().pathForResource("gif3", ofType: "gif")
            gif = NSData(contentsOfFile: filePath!)
    }
    
    func createSnapshot()
    {
        //creating the image. first step getting size
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
   
    @IBAction func mailCustomerCare(sender: AnyObject) {
        
        let emailTitle = "Business query through app"
        var messageBody = ""
        let toRecipients = ["vankonindia@gmail.com"]
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setToRecipients(toRecipients)
        mc.setMessageBody(emailTitle, isHTML: false)
        self.presentViewController(mc, animated: true, completion: nil)
        
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        
        switch result.rawValue {
        case MFMailComposeResultSent.rawValue : print("Mail Sent successfully")
            
        case MFMailComposeResultCancelled.rawValue : print("Mail Canceeled")
            
        case MFMailComposeResultSaved.rawValue : print("Mail Saved")
            
        case MFMailComposeResultFailed.rawValue : print("Mail Failed")
            
        default : break
        }
        
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func openWebsite(sender: AnyObject) {
        
        performSegueWithIdentifier("showWebsite", sender: nil)
    }
    
        
    override func viewWillAppear(animated: Bool) {
        getgif()
        self.backgroundWebView.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL:NSURL() )
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundWebView.userInteractionEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToNav(sender : AnyObject?)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
        performSegueWithIdentifier("showMenu", sender: nil)
        print("hi")
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMenu" {
            let vc = segue.destinationViewController as! NavMenuTableViewController
            createSnapshot()
            vc.backgroundImage = image
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
