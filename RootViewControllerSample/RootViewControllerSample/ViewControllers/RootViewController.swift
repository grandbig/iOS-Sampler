//
//  RootViewController.swift
//  RootViewControllerSample
//
//  Created by Takahiro Kato on 2019/02/16.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    // MARK: - Properties
    private var current: UIViewController

    enum Destination {
        case login
        case main
    }

    // MARK: - Initial Methods
    init() {
        current = SplashViewController()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        showScreen(for: current)
    }

    // MARK: - Router Methods
    func route(from viewController: UIViewController, destination: Destination) {
        switch destination {
        case .login:
            showLoginScreen()
        case .main:
            showMainScreen()
        }
    }

    func showLoginScreen() {
        let loginViewController = LoginViewController.make()
        showScreen(for: loginViewController)
        replaceCurrent(to: loginViewController)
    }

    func showMainScreen() {
        let mainViewController = ViewController.make()
        showScreen(for: mainViewController)
        replaceCurrent(to: mainViewController)
    }

    // MARK: - Other Methods
    private func showScreen(for viewController: UIViewController) {
        addChild(viewController)
        viewController.view.bounds = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    private func replaceCurrent(to viewController: UIViewController) {
        current.willMove(toParent: nil)
        current.view.removeFromSuperview()
        current.removeFromParent()
        current = viewController
    }
}
