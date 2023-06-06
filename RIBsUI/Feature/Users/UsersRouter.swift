//
//  UsersRouter.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs

protocol UsersInteractable: Interactable {
    var router: UsersRouting? { get set }
    var listener: UsersListener? { get set }
}

protocol UsersViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class UsersRouter: ViewableRouter<UsersInteractable, UsersViewControllable>, UsersRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: UsersInteractable, viewController: UsersViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
