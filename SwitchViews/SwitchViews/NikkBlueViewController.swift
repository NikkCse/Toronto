//
//  NikkBlueViewController.swift
//  SwitchViews
//
//  Created by Nikhil Jassal on 2017-03-30.
//  Copyright © 2017 Nikhil Jassal. All rights reserved.
//

import UIKit

class NikkBlueViewController: UIViewController {

    
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var NumLabel: UILabel!
    @IBOutlet weak var NikkTv1: UITextField!
    @IBOutlet weak var NikkTv2: UITextField!
    
    @IBOutlet weak var sliderlabel: UILabel!
    
    @IBOutlet weak var Sliderbar: UISlider!
    
   
    @IBOutlet weak var NikkLeftSwitch: UISwitch!
    
    @IBOutlet weak var NikkRightSwitch: UISwitch!
    
    @IBOutlet weak var NikkSwitchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func NikkDonePressed(_ sender: UITextField) {
        (sender as AnyObject).resignFirstResponder()

        
    }

    
    @IBAction func NikkBackgroundTap(_ sender: UIControl) {
        
        NikkTv1.resignFirstResponder()
        NikkTv2.resignFirstResponder()
        
    }
    
    @IBAction func NikkMainSliderbar(_ sender: UISlider) {
         sliderlabel.text = "\(lroundf(sender.value))"
    }
    
    @IBAction func NikkSegmentedValueChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {  // "Switches" is selected
            NikkLeftSwitch.isHidden = false
            NikkRightSwitch.isHidden = false
            NikkSwitchButton.isHidden = true
        } else {
            NikkLeftSwitch.isHidden = true
            NikkRightSwitch.isHidden = true
            NikkSwitchButton.isHidden = false
        }
        
    }
    
    
    @IBAction func SwitchValueChange(_ sender: UISwitch) {
        
        let setting = sender.isOn
        NikkLeftSwitch.setOn(setting, animated: true)
        NikkRightSwitch.setOn(setting, animated: true)

        
    }
    
    
    @IBAction func DoSomething(_ sender: UIButton) {
        
        
            let controller = UIAlertController(title: "Are You Sure?",
                                               message:nil, preferredStyle: .actionSheet)
            
            let yesAction = UIAlertAction(title: "Yes, I'm sure!",
                                          style: .destructive, handler: { action in
                                            let msg = self.NikkTv1.text!.isEmpty
                                                ? "Name: Nikhil \n Age: 24 \n Year : 1992"
                                                : "You can breathe easy, \(self.NikkTv1.text),"
                                                + "everything went OK."
                                            let controller2 = UIAlertController(
                                                title:"Hey Nikk! You are Great Developer",
                                                message: msg, preferredStyle: .alert)
                                            let cancelAction = UIAlertAction(title: "Okay",
                                                                             style: .cancel, handler: nil)
                                            controller2.addAction(cancelAction)
                                            self.present(controller2, animated: true,
                                                         completion: nil)
            })
            
            let noAction = UIAlertAction(title: "No way!",
                                         style: .cancel, handler: nil)
            
            controller.addAction(yesAction)
            controller.addAction(noAction)
            
            if let ppc = controller.popoverPresentationController {
                ppc.sourceView = sender
                ppc.sourceRect = sender.bounds
                ppc.permittedArrowDirections = .down
            }
            
            present(controller, animated: true, completion: nil)
            
            
            
        }
        
        
    }
    


