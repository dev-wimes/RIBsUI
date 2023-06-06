//
//  RootViewController.swift
//  SwiftUIInRIBs
//
//  Created by Wimes on 2023/05/29.
//

import RIBs
import RxSwift
import SwiftUI

final class RootViewController<Content: View>: UIHostingController<Content>, RootViewControllable {
  // MARK: Presentable관련 코드들이 모두 삭제된다. ViewController는 SwiftUI를 Hosting해주는 역할만 할 뿐이다.
  
  override init(rootView: Content) {
    super.init(rootView: rootView)
  }
  
  @MainActor required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
