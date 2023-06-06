//
//  RootBuilder.swift
//  SwiftUIInRIBs
//
//  Created by Wimes on 2023/05/29.
//

import RIBs

protocol RootDependency: Dependency {
  // TODO: Declare the set of dependencies required by this RIB, but cannot be
  // created by this RIB.
}

final class RootComponent: Component<RootDependency>,
                           RootInteractorDependency,
                           UsersDependency {
  
}

// MARK: - Builder

protocol RootBuildable: Buildable {
  func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {
  
  override init(dependency: RootDependency) {
    super.init(dependency: dependency)
  }
  
  func build() -> LaunchRouting {
    let component = RootComponent(dependency: dependency)
    let interactor = RootInteractor(dependency: component)
    
    let viewController = RootViewController(rootView: RootView(interactor: interactor))
    let navigationViewController = NavigationControllerable(root: viewController)
    
    let usersBuilder = UsersBuilder(dependency: component)
    
    return RootRouter(
      interactor: interactor,
      viewController: navigationViewController,
      usersBuilder: usersBuilder
    )
  }
}
