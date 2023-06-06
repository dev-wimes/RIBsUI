//
//  NavigationControllable.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs
import UIKit

public final class NavigationControllerable: ViewControllable {
  public var uiviewController: UIViewController { self.navigationController }
  let navigationController: UINavigationController
  
  public init(root: ViewControllable) {
    let navigation = UINavigationController(rootViewController: root.uiviewController)
    navigation.navigationBar.isTranslucent = false
    navigation.navigationBar.backgroundColor = .white
    navigation.navigationBar.scrollEdgeAppearance = navigation.navigationBar.standardAppearance
    
    self.navigationController = navigation
  }
}
