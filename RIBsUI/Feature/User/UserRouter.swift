//
//  UserRouter.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs

protocol UserInteractable: Interactable {
    var router: UserRouting? { get set }
    var listener: UserListener? { get set }
}

protocol UserViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class UserRouter: ViewableRouter<UserInteractable, UserViewControllable>, UserRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: UserInteractable, viewController: UserViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
