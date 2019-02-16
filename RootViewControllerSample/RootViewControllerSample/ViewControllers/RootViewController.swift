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
        current = SplashViewController.make()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // ここでshowScreenメソッドを利用しない理由を下記に記載
        // current.view.boundsのタイミングでSplashViewControllerのviewDidLoad()が呼ばれる
        // これによりshowLoginScreen()まで処理が流れて、currentがLoginViewControllerに置き換わる
        // showScreen(for: current)を実行すると、メモリ上ではcurrent = SplashViewControllerとなっているため、
        // 削除された後にSplashViewController.viewだけ追加することになる
        // これはメソッドの引数渡しが値渡しであるため
        addChild(current)
        current.view.bounds = view.bounds
        view.addSubview(current.view)
        current.didMove(toParent: self)
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
