//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Lugalu on 03/02/23.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            createNavController(for: NoteListingView(), title: "Private", image: UIImage(systemName: "lock"))
           // createNavController(for: NoteListingView(), title: "Public", image: UIImage(systemName: "lock.open"))
                               
        ]
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage?) -> UIViewController {
        
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
        
          return navController
      }
}
