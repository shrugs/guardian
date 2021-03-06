//
//  StartingViewController.swift
//  guardian2
//
//  Created by Matt Condon on 9/13/15.
//  Copyright © 2015 mattc. All rights reserved.
//

import UIKit
import SnapKit

protocol StartingViewControllerDelegate {
  func didBegin()
}

class StartingViewController: UIViewController {
  var delegate : StartingViewControllerDelegate?

  lazy var banner : UIImageView = {
    let v = UIImageView(image: UIImage(named: "clear_icon")!)
    v.contentMode = .ScaleAspectFit
    v.userInteractionEnabled = true
    return v
  }()

  lazy var titleLabel : UILabel = {
    let l = UILabel()
    l.text = "Guardian"
    l.textAlignment = .Center
    l.font = UIFont.themeFont()
    l.textColor = .highlightColor()
    return l
  }()


  override func viewDidLoad() {
    super.viewDidLoad()

    let cont = UIView()
    view.addSubview(cont)
    cont.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(view)
      make.centerY.equalTo(view.snp_centerY).multipliedBy(0.5)
      make.width.equalTo(view)
      make.height.equalTo(view).multipliedBy(0.5)
    }

    cont.addSubview(banner)
    banner.snp_makeConstraints { (make) -> Void in
      make.center.equalTo(cont)
      make.height.equalTo(cont).multipliedBy(0.3)
    }

    cont.addSubview(titleLabel)
    titleLabel.snp_makeConstraints { (make) -> Void in
      make.top.equalTo(banner.snp_bottom)
      make.left.right.equalTo(cont)
    }

    let btn = MyButton(text: "Login with Uber")
    btn.addTarget(self, action: "done", forControlEvents: .TouchUpInside)

    view.addSubview(btn)
    btn.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(view)
      make.width.equalTo(view).multipliedBy(0.8)
      make.height.equalTo(50)
      make.bottom.equalTo(view).offset(-40)
    }

    let info = UILabel()
    info.text = "Sign in with Uber to get started."
    info.font = UIFont.textFont()
    info.textColor = .highlightColor()
    info.textAlignment = .Center
    info.numberOfLines = 2
    view.addSubview(info)
    info.snp_makeConstraints { (make) -> Void in
      make.centerX.equalTo(view)
      make.bottom.equalTo(btn.snp_top).offset(-10)
      make.width.equalTo(view).multipliedBy(0.7)
      make.height.equalTo(150)
    }

  }

  func done() {
    delegate?.didBegin()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
