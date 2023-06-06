//
//  UserViewController.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs
import RxSwift
import SwiftUI

final class UserViewController<Content: View>: UIHostingController<Content>, UserViewControllable {

  override init(rootView: Content) {
    super.init(rootView: rootView)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
