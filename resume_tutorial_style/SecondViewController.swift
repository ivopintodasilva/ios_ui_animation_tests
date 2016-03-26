//
//  SecondViewController.swift
//  resume_tutorial_style
//
//  Created by Ivo Silva on 25/03/16.
//  Copyright © 2016 Ivo Silva. All rights reserved.
//

import UIKit
import CBStoreHouseRefreshControl
import JBKenBurnsView

class SecondViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var kenView: JBKenBurnsView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let icon: UIImage = UIImage(named: "github.png")!
        //let color: UIColor = UIColor.blackColor()
        //let splashView = CBZSplashView.splashViewWithIcon(icon, backgroundColor: color)
        //let splash_view = MSTwitterSplashScreen.initSplashScreenWithBezierPath(bezierPath, backgroundColor: backgroundColor, logoColor: logoColor)

        
        self.view.backgroundColor = UIColor(red: 179/255.0, green: 194/255.0, blue: 191/255.0, alpha: 1)
        
        kenView = JBKenBurnsView(frame: CGRect(x: 0, y: 0, width:UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height))
        kenView.alpha = 0.2
        
        kenView.animateWithImages([UIImage(named: "aveiro.jpg")!, UIImage(named: "ams.jpg")!], transitionDuration: 20, initialDelay: 0, loop: true, isLandscape: true)
        self.view.addSubview(kenView)
        
        /*  create name label  */
        let label = UILabel(frame: CGRectMake(0, 0, 300, 30))
        label.center = CGPointMake((UIScreen.mainScreen().bounds.width)/2, (UIScreen.mainScreen().bounds.height/2) + 60 )
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.text = "github.com/ivopintodasilva"
        label.font = UIFont(name: "Avenir-Heavy", size: 16)
        
        let image = UIImage(named: "github2.png")
        let image_view = UIImageView(image: image)
        image_view.frame = CGRect(x: 0 , y: 0, width: 170, height: 170)
        image_view.center.x = UIScreen.mainScreen().bounds.width/2
        image_view.center.y = (UIScreen.mainScreen().bounds.height/2)-7
        self.view.addSubview(image_view)
        
        self.view.addSubview(label)
        
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
