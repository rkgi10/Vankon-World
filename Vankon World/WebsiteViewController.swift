//
//  WebsiteViewController.swift
//  Vankon World
//
//  Created by Rohit Gurnani on 11/07/15.
//  Copyright (c) 2015 Rohit Gurnani. All rights reserved.
//

import UIKit

class WebsiteViewController: UIViewController {
    
    
    @IBOutlet weak var shareBtn: DesignableButton!
    @IBOutlet weak var webView: UIWebView!
    var isOffers = false
    var isVideos = false
    var isPresented = true

    override func viewDidLoad() {
        super.viewDidLoad()
        if !isOffers {
            
            if isVideos {
                let webURL = NSURL(string: "https://www.youtube.com/channel/UCTyBOID7K68qa0orm2_QZ2Q/videos")
                let requestObj = NSURLRequest(URL: webURL!)
                webView.loadRequest(requestObj)
                
            }
            else
            {
            let webURL = NSURL(string: "http://www.vankonindia.com")
            let requestObj = NSURLRequest(URL: webURL!)
            webView.loadRequest(requestObj)
            }
        }
        
        else
        {
            let webURL = NSURL(string: "http://www.vankonindia.com")
            let requestObj = NSURLRequest(URL: webURL!)
            webView.loadRequest(requestObj)
        }
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToHome(sender: AnyObject) {
        self.isPresented = false
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func shareApp(sender: AnyObject) {
        
        let textToShare = "The Vankon World app is awesome!!  You too can download the app on the App Store or Play Store. Go ahead, download it here:  "
        
            if let linkToShare = NSURL(string: "http://vankonworld.github.io")
            {
                let objToShare = [textToShare , linkToShare]
                let shareActivityVC = UIActivityViewController(activityItems: objToShare, applicationActivities: nil)
                
                if let popView = shareActivityVC.popoverPresentationController {
                    popView.sourceView = shareBtn
                }
                presentViewController(shareActivityVC, animated: true, completion: nil)
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
