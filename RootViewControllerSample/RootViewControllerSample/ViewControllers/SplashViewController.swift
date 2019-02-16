//
//  SplashViewController.swift
//  RootViewControllerSample
//
//  Created by Takahiro Kato on 2019/02/16.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Twitterみたいにアニメーションを追加することも可能

        judgeDestination()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Factory Methods
    static func make() -> SplashViewController{
        guard let splashViewController = UIStoryboard(name: "Splash", bundle: nil).instantiateInitialViewController()
            as? SplashViewController else {
                fatalError("cannot get LoginViewController from Storyboard")
        }
        return splashViewController
    }

    // MARK: - Other Methods
    private func judgeDestination() {
        if UserDefaults.standard.bool(forKey: "isLogin") {
            AppDelegate.shared.routeViewController.route(from: self, destination: .main)
            return
        }
        AppDelegate.shared.routeViewController.route(from: self, destination: .login)
    }
}
