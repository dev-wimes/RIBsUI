//
//  UsersBuilder.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs

protocol UsersDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class UsersComponent: Component<UsersDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol UsersBuildable: Buildable {
    func build(withListener listener: UsersListener) -> UsersRouting
}

final class UsersBuilder: Builder<UsersDependency>, UsersBuildable {

    override init(dependency: UsersDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: UsersListener) -> UsersRouting {
        let component = UsersComponent(dependency: dependency)
        let viewController = UsersViewController()
        let interactor = UsersInteractor(presenter: viewController)
        interactor.listener = listener
        return UsersRouter(interactor: interactor, viewController: viewController)
    }
}
