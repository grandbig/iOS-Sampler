//
//  LoginViewController.swift
//  RootViewControllerSample
//
//  Created by Takahiro Kato on 2019/02/16.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Factory Methods
    static func make() -> LoginViewController{
        guard let loginViewController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController()
            as? LoginViewController else {
            fatalError("cannot get LoginViewController from Storyboard")
        }
        return loginViewController
    }
}
