//
//  UserBuilder.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs

protocol UserDependency: Dependency {
}

final class UserComponent: Component<UserDependency>, UserInteractorDependency {
  let repository: UserRepository
  
  init(dependency: UserDependency, repository: UserRepository) {
    self.repository = repository
    
    super.init(dependency: dependency)
  }
}

// MARK: - Builder

protocol UserBuildable: Buildable {
  func build(withListener listener: UserListener) -> UserRouting
}

final class UserBuilder: Builder<UserDependency>, UserBuildable {
  
  override init(dependency: UserDependency) {
    super.init(dependency: dependency)
  }
  
  func build(withListener listener: UserListener) -> UserRouting {
    let component = UserComponent(dependency: dependency, repository: UserRepositoryImpl())
    let interactor = UserInteractor(dependency: component)
    let viewController = UserViewController(rootView: UserView(interactor: interactor))
    
    interactor.listener = listener
    return UserRouter(interactor: interactor, viewController: viewController)
  }
}
