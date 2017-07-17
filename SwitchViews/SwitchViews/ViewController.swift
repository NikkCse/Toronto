//
//  ViewController.swift
//  SwitchViews
//
//  Created by Nikhil Jassal on 2017-03-30.
//  Copyright © 2017 Nikhil Jassal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var blueViewController: NikkBlueViewController!
    private var greenViewController: NikkGreen!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        blueViewController =
            storyboard?.instantiateViewController(withIdentifier: "Blue")
            as! NikkBlueViewController
        blueViewController.view.frame = view.frame
        switchViewController(from: nil, to: blueViewController)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
        
        if blueViewController != nil
            && blueViewController!.view.superview == nil {
            blueViewController = nil
        }
        if greenViewController != nil
            && greenViewController!.view.superview == nil {
            greenViewController = nil
        }
    }

    @IBAction func NikkSwitch(_ sender: UIBarButtonItem) {
        
            // Create the new view controller, if required
            if greenViewController?.view.superview == nil {
                if greenViewController == nil {
                    greenViewController =
                        storyboard?.instantiateViewController(withIdentifier: "Green")
                        as! NikkGreen
                }
            } else if blueViewController?.view.superview == nil {
                if blueViewController == nil {
                    blueViewController =
                        storyboard?.instantiateViewController(withIdentifier: "Blue")
                        as! NikkBlueViewController
                }
            }
            
            UIView.beginAnimations("View Flip", context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationCurve(.easeInOut)
            // Switch view controllers
            if blueViewController != nil
                && blueViewController!.view.superview != nil {
                UIView.setAnimationTransition(.flipFromRight,
                                              for: view, cache: true)
                greenViewController.view.frame = view.frame
                switchViewController(from: blueViewController,
                                     to: greenViewController)
            } else {
                UIView.setAnimationTransition(.flipFromLeft,
                                              for: view, cache: true)
                blueViewController.view.frame = view.frame
                switchViewController(from: greenViewController,
                                     to: blueViewController)
            }
            UIView.commitAnimations()
        
    }
    private func switchViewController(from fromVC:UIViewController?,
                                      to toVC:UIViewController?) {
        if fromVC != nil {
            fromVC!.willMove(toParentViewController: nil)
            fromVC!.view.removeFromSuperview()
            fromVC!.removeFromParentViewController()
        }
        
        if toVC != nil {
            self.addChildViewController(toVC!)
            self.view.insertSubview(toVC!.view, at: 0)
            toVC!.didMove(toParentViewController: self)
        }
    }

    
}

