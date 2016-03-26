//
//  ViewController.swift
//  resume_tutorial_style
//
//  Created by Ivo Silva on 25/03/16.
//  Copyright © 2016 Ivo Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index: Int = ((viewController as! PageContentViewController)).pageIndex
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index--
        return self.viewControllerAtIndex(index)
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index: Int = ((viewController as! PageContentViewController)).pageIndex
        if index == NSNotFound {
            return nil
        }
        index++
        if index == self.pageTitles.count {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }

}

