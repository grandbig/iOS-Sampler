//
//  ThirdViewController.swift
//  AutoLayoutSample
//
//  Created by Takahiro Kato on 2019/04/07.
//  Copyright © 2019 Takahiro Kato. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    private let prefixLabels = ["a",
                                "i",
                                "hogehoge",
                                "hogehogehogehogehogehogehogehogehogehogehogehoge",
                                "hogehoge",
                                "poipoipoipoipoipoipoipoipoipoipoipoipoipoipoipoi"]
    private let domainLabels = ["b",
                                "i",
                                "gmail.com",
                                "gmail.com",
                                "fugafugafugafugafugafugafugafugafugafugafuga.com",
                                "fugafugafugafugafugafugafugafugafugafugafuga.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib.init(nibName: "ThirdCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "thirdCustomTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func drawWithRect(label: UILabel) {
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        style.alignment = NSTextAlignment.left
        let stringAttrubute = [
            NSAttributedString.Key.paragraphStyle: style
        ]
        label.text?.draw(with: CGRect(x: 0, y: 0, width: 50.0, height: label.frame.size.height),
                    options: [.usesLineFragmentOrigin, .truncatesLastVisibleLine],
                    attributes: stringAttrubute,
                    context: nil)
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefixLabels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCustomTableViewCell", for: indexPath)
        
        if let customCell = cell as? ThirdCustomTableViewCell {
            customCell.prefixLabel.text = prefixLabels[indexPath.row]
            customCell.domainLabel.text = domainLabels[indexPath.row]
            
            // 表示フレームを作成。CGSizeMake(最大幅, 最大高さ)
            let frame = CGSize(width: 250, height: .max)
            // 文字列の幅に調節したサイズを取得
            let rect = customCell.prefixLabel.sizeThatFits(frame)
            if rect.width <= customCell.prefixLabelMaxWidthConstraint.constant {
                // UILabel の width の制約に、調節済みの width を設定
                customCell.prefixLabelMinWidthConstraint.constant = rect.width
            } else {
                drawWithRect(label: customCell.prefixLabel)
            }
            
            return customCell
        }
        
        return cell
    }
}
