//
//  CustomTabBarController.swift
//  EffectiveMobile-Test
//
//  Created by Евгений Михневич on 17.02.2023.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var customTabBarView = UIView(frame: .zero)
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarUI()
        self.addCustomTabBarView()
        tabBar.tintColor = .white
        tabBar.barTintColor = .gray
        setupViewControllers()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupCustomTabBarFrame()
    }
        
    private func setupCustomTabBarFrame() {
        let height = self.view.safeAreaInsets.bottom + 64
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - 80
        self.tabBar.frame = tabFrame
        customTabBarView.frame = tabBar.frame
    }
    
    private func setupTabBarUI() {
        self.tabBar.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        self.tabBar.layer.cornerRadius = 40
    }
    
    private func addCustomTabBarView() {
        self.customTabBarView.frame = tabBar.frame
        self.customTabBarView.layer.cornerRadius = 40
        self.view.addSubview(customTabBarView)
        self.view.bringSubviewToFront(self.tabBar)
    }
    
    private func createNavigationController(for rootViewController: UIViewController,title: String, image: UIImage?) -> UIViewController {
            let navigationController = UINavigationController(rootViewController: rootViewController)
            navigationController.tabBarItem.title = title
            navigationController.tabBarItem.image = image
            navigationController.navigationBar.prefersLargeTitles = true
            return navigationController
        }
    
    private func setupViewControllers() {
          viewControllers = [
            createNavigationController(for: AllProductsViewController(), title: "Explorer", image: UIImage(named: "explorer")),
            createNavigationController(for: UIViewController(), title: "Cart", image: UIImage(named: "cart")),
            createNavigationController(for: FavouritesViewController(), title: "Favourites", image: UIImage(named: "favourites")),
            createNavigationController(for: UIViewController(), title: "Profile", image: UIImage(named: "profile")),
          ]
      }

}
