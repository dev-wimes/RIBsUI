//
//  RootRouter.swift
//  SwiftUIInRIBs
//
//  Created by Wimes on 2023/05/29.
//

import RIBs

protocol RootInteractable: Interactable, UsersListener {
  var router: RootRouting? { get set }
  var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, ViewControllable>, RootRouting {
  
  private var usersRouter: UsersRouting?
  private let usersBuilder: UsersBuildable
  
  init(
    interactor: RootInteractable,
    viewController: ViewControllable,
    usersBuilder: UsersBuildable
  ) {
    self.usersBuilder = usersBuilder
    
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}

extension RootRouter {
  func attachUsers() {
    if self.usersRouter != nil { return }
    
    let router = self.usersBuilder.build(withListener: self.interactor)
    self.usersRouter = router
    self.attachChild(router)
    
    self.viewController.pushViewController(router.viewControllable, animated: true)
  }
  
  func detachUsers() {
    guard let router = self.usersRouter else { return }
    
    self.detachChild(router)
    self.usersRouter = nil
    self.viewController.popViewController(animated: true)
  }
}
