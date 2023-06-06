//
//  RootRouter.swift
//  SwiftUIInRIBs
//
//  Created by Wimes on 2023/05/29.
//

import RIBs

protocol RootInteractable: Interactable, UserListener {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, ViewControllable>, RootRouting {
  
  private var userRouter: UserRouting?
  private let userBuilder: UserBuildable
  
  init(
    interactor: RootInteractable,
    viewController: ViewControllable,
    userBuilder: UserBuildable
  ) {
    self.userBuilder = userBuilder
    
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

extension RootRouter {
  func attachUser() {
    if self.userRouter != nil { return }
    
    let router = self.userBuilder.build(withListener: self.interactor)
    self.userRouter = router
    self.attachChild(router)
    
    self.viewController.pushViewController(router.viewControllable, animated: true)
  }
  
  func detachUser() {
    guard let router = self.userRouter else { return }
    
    self.detachChild(router)
    self.userRouter = nil
    self.viewController.popViewController(animated: true)
  }
}
