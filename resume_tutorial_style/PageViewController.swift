//
//  PageViewController.swift
//  resume_tutorial_style
//
//  Created by Ivo Silva on 25/03/16.
//  Copyright © 2016 Ivo Silva. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        setViewControllers([UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("first")],
            direction: .Forward,
            animated: true,
            completion: nil)
        
    }
    
    
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            
            if(viewController.restorationIdentifier == "first"){
                //return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("third")
                return nil
            }
            else if(viewController.restorationIdentifier == "second"){
                return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("first")
            }
            else{
                return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("second")
            }
            
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            
            if(viewController.restorationIdentifier == "first"){
                return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("second")
            }
            else if(viewController.restorationIdentifier == "second"){
                return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("third")
            }
            else{
                //return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("first")
                return nil
            }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
