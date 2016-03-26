//
//  FirstViewController.swift
//  resume_tutorial_style
//
//  Created by Ivo Silva on 25/03/16.
//  Copyright © 2016 Ivo Silva. All rights reserved.
//

import UIKit
import PulsingHalo
import Font_Awesome_Swift
import RKNotificationHub
import AYVibrantButton
import ASProgressPopUpView
import DynamicButton
import CNPPopupController

class FirstViewController: UIViewController {
    
    var scrollView: UIScrollView!
    var hub: RKNotificationHub!
    var invertButton: AYVibrantButton!
    var dynamicButton: DynamicButton!
    var s_label: UILabel!
    var progress_view: ASProgressPopUpView!
    var blurEffectView: UIVisualEffectView!
    var popup: CNPPopupController!
    var i = 0
    var j = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*  get superview's layout margins  */
        let margins = view.layoutMarginsGuide
        
        /*  Pin the leading edge of myView to the margin's leading edge  */
        view.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor).active = true

        
        /*  Pin the trailing edge of myView to the margin's trailing edge  */
        view.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor).active = true
        
        /*  Give myView a 1:2 aspect ratio  */
        view.heightAnchor.constraintEqualToAnchor(view.widthAnchor, multiplier: 2.0)
        
        
        /*  initializing scrollView  */
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = CGSize(width:UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        
        /*  background color  */
        scrollView.backgroundColor = UIColor(red: 192/255.0, green: 223/255.0, blue: 217/255.0, alpha: 1)
        
        
        /*  initialize background image  */
        let image_name = "eind.jpg"
        let image = UIImage(named: image_name)
        let image_view = UIImageView(image: image!)
        image_view.alpha = 0.3
        image_view.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height)
        scrollView.addSubview(image_view)
        
        /*  create profile image  */
        let profile_image = UIImage(named: "ivo.png")
        let profile_image_view = UIImageView(image: profile_image!)
        profile_image_view.frame = CGRect(x: (UIScreen.mainScreen().bounds.width/2) - 25 , y: (UIScreen.mainScreen().bounds.height/2) - 225, width: 170, height: 170)
        profile_image_view.layer.cornerRadius = profile_image_view.frame.height/2
        profile_image_view.clipsToBounds = true
        
        /*  create pulsating halo  */
        let halo = PulsingHaloLayer()
        halo.position = profile_image_view.center
        halo.haloLayerNumber = 2;
        halo.radius = 160.0;
        halo.backgroundColor = UIColor.whiteColor().CGColor
        halo.start()
        
        scrollView.layer.addSublayer(halo)
        scrollView.addSubview(profile_image_view)
        
        /*  create name label  */
        let label = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width-150, 60))
        label.center = CGPointMake(UIScreen.mainScreen().bounds.width - label.frame.width/2, (UIScreen.mainScreen().bounds.height/2)+10)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1.0)
        label.layer.shadowColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1.0).CGColor
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 2
        label.text = "Ivo Silva"
        label.font = UIFont(name: "Avenir-HeavyOblique", size: 30)
        label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        label.alpha = 0.8
        scrollView.addSubview(label)
        
        
        
        /*  create description label  */
        let d_label = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width-100, 60))
        d_label.center = CGPointMake(UIScreen.mainScreen().bounds.width - d_label.frame.width/2, (UIScreen.mainScreen().bounds.height/2)+85)
        d_label.textAlignment = NSTextAlignment.Center
        d_label.textColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1.0)
        d_label.layer.shadowColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1.0).CGColor
        d_label.layer.shadowOffset = CGSize(width: 3, height: 3)
        d_label.layer.shadowOpacity = 0.7
        d_label.layer.shadowRadius = 2
        d_label.text = "Mobile & Web Developer"
        d_label.font = UIFont(name: "Avenir-HeavyOblique", size: 15)
        d_label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        d_label.alpha = 0.8
        scrollView.addSubview(d_label)
        
        
        
        /*  create social media label  */
        let s_label = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width-50, 60))
        s_label.center = CGPointMake(UIScreen.mainScreen().bounds.width - s_label.frame.width/2, (UIScreen.mainScreen().bounds.height/2)+160)
        s_label.textAlignment = NSTextAlignment.Left
        s_label.textColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1.0)
        s_label.layer.shadowColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1.0).CGColor
        s_label.layer.shadowOffset = CGSize(width: 3, height: 3)
        s_label.layer.shadowOpacity = 0.7
        s_label.layer.shadowRadius = 2
        s_label.text = "         Follow me on "
        s_label.font = UIFont(name: "Avenir-HeavyOblique", size: 21)
        s_label.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1)
        s_label.alpha = 0.8
        scrollView.addSubview(s_label)
        
        
        /*  create github image  */
        let github_image = UIImage(named: "github.png")
        let github_image_view = UIImageView(image: github_image!)
        github_image_view.alpha = 0.7
        github_image_view.frame = CGRect(x: UIScreen.mainScreen().bounds.width - 60, y: (UIScreen.mainScreen().bounds.height/2)+140, width: 40, height: 40)
        scrollView.addSubview(github_image_view)
        
        /*  create button to click  */
        invertButton = AYVibrantButton(frame: CGRect(x: 20, y: UIScreen.mainScreen().bounds.height - 70, width: UIScreen.mainScreen().bounds.width - 40, height: 50), style: AYVibrantButtonStyleInvert)
        invertButton.vibrancyEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: .Dark))
        invertButton.text = "Don't press the button"
        invertButton.backgroundColor = UIColor.whiteColor()
        invertButton.font = UIFont(name: "Avenir-Heavy", size: 21)
        /*  set listener for button  */
        invertButton.addTarget(self, action: #selector(FirstViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        scrollView.addSubview(invertButton)
        /*  set notification hub on button  */
        hub = RKNotificationHub(view: invertButton)
        hub.setCircleColor(UIColor.whiteColor(), labelColor: UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1))
        
        /*  add all views to scroll view  */
        self.view.addSubview(scrollView)
        self.view.bringSubviewToFront(scrollView)

    }
    
    func buttonClicked(sender: AnyObject?) {
        hub.increment()
        hub.pop()
        if i == 0{
            invertButton.text = "Oh no you didn't!"
        }else if i == 1{
            invertButton.text = "Strike 2!"
        }else if i == 2{
            if !UIAccessibilityIsReduceTransparencyEnabled() {
                self.view.backgroundColor = UIColor.clearColor()
                let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
                blurEffectView = UIVisualEffectView(effect: blurEffect)
                blurEffectView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
                blurEffectView.frame = self.view.bounds
                blurEffectView.tag = 99
                
                UIView.transitionWithView(self.view!, duration: 0.3, options: .TransitionCrossDissolve, animations: {() -> Void in
                    self.view.addSubview(self.blurEffectView)
                    }, completion: { _ in })

                
            } 
            else {
                self.view.backgroundColor = UIColor.whiteColor()
            }
            
            
            progress_view = ASProgressPopUpView(frame: CGRect(x: 20, y: UIScreen.mainScreen().bounds.height/2, width: UIScreen.mainScreen().bounds.width-40, height: 40))
            self.view.addSubview(progress_view)
            progress_view.font = UIFont(name: "Avenir", size: 26)
            progress_view.textColor = UIColor.blackColor()
            progress_view.popUpViewAnimatedColors = [UIColor.whiteColor(), UIColor.whiteColor(), UIColor.greenColor()]
            progress_view.popUpViewCornerRadius = 16.0
            progress_view.showPopUpViewAnimated(true)
            progress_view.progress = 0.99
            progress_view.tag = 100
            
            
            s_label = UILabel(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width-50, 60))
            s_label.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, (UIScreen.mainScreen().bounds.height/2) + 30)
            s_label.textAlignment = NSTextAlignment.Center
            s_label.textColor = UIColor.whiteColor()
            s_label.text = "Deleting your Github account"
            s_label.font = UIFont(name: "Avenir-HeavyOblique", size: 18)
            s_label.tag == 101
            self.view.addSubview(s_label)
            
            
            dynamicButton = DynamicButton(style: .CircleClose)
            dynamicButton.strokeColor = UIColor.whiteColor()
            dynamicButton.highlightStokeColor = UIColor.redColor()
            dynamicButton.center = CGPointMake(UIScreen.mainScreen().bounds.width/2, (UIScreen.mainScreen().bounds.height) - 50)
            dynamicButton.addTarget(self, action: #selector(FirstViewController.dynamicButtonClicked(_:)), forControlEvents: .TouchUpInside)
            dynamicButton.tag = 102
            self.view.addSubview(dynamicButton)
            
            
        }
        else if i == 9{
            
            let titleLabel: UILabel = UILabel()
            titleLabel.numberOfLines = 0
            titleLabel.attributedText = NSAttributedString(string:"Daaamn")
            titleLabel.font = UIFont(name: "Avenir-Heavy", size: 22)
            titleLabel.textAlignment = NSTextAlignment.Center
            
            
            let lineOneLabel: UILabel = UILabel()
            lineOneLabel.numberOfLines = 0
            lineOneLabel.attributedText = NSAttributedString(string:"You really like notifications!")
            lineOneLabel.font = UIFont(name: "Avenir", size: 18)
            lineOneLabel.textAlignment = NSTextAlignment.Center
            
            let customView: UIView = UIView(frame: CGRectMake(0, 0, 250, 55))
            customView.backgroundColor = UIColor.lightGrayColor()


            popup = CNPPopupController(contents: [titleLabel, lineOneLabel])
            //popup.theme = (CNPPopupTheme.defaultTheme)
            popup.presentPopupControllerAnimated(true)
            
        }
        i += 1
    }
    
    func dynamicButtonClicked(sender: AnyObject?) {
        if j == 0{
            dynamicButton.setStyle(.CheckMark, animated: true)
            dynamicButton.highlightStokeColor = UIColor.greenColor()
            j += 1
        }else if j == 1{
            for v in view.subviews{
                if v.tag == 99 || v.tag == 100 || v.tag == 101 || v.tag == 102{
                    
                    UIView.transitionWithView(self.view!, duration: 0.3, options: .TransitionCrossDissolve, animations: {() -> Void in
                        v.removeFromSuperview()
                        }, completion: { _ in })
                    
                }
                s_label.text = ""
            }
            invertButton.text = "JK, click me!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(Bool(animated))
    }



}
