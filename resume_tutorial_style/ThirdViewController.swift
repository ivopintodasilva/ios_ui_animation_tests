//
//  ThirdViewController.swift
//  resume_tutorial_style
//
//  Created by Ivo Silva on 25/03/16.
//  Copyright © 2016 Ivo Silva. All rights reserved.
//

import UIKit
import AYVibrantButton

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 59/255.0, green: 58/255.0, blue: 54/255.0, alpha: 1)
        
        var invertButton: AYVibrantButton = AYVibrantButton(frame: CGRect(x: 20, y: UIScreen.mainScreen().bounds.height/2, width: UIScreen.mainScreen().bounds.width - 20, height: 30), style: AYVibrantButtonStyleInvert)
        invertButton.vibrancyEffect = UIVibrancyEffect(forBlurEffect: UIBlurEffect(style: .Dark))
        invertButton.text = "Invert"
        invertButton.backgroundColor = UIColor.whiteColor()
        invertButton.font = UIFont.systemFontOfSize(18.0)
        view.addSubview(invertButton)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
