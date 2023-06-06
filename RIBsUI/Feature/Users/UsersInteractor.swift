//
//  UsersInteractor.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs
import RxSwift

protocol UsersRouting: ViewableRouting {
}

protocol UsersPresentable: Presentable {
    var listener: UsersPresentableListener? { get set }
}

protocol UsersListener: AnyObject {
    
}

final class UsersInteractor: PresentableInteractor<UsersPresentable>, UsersInteractable, UsersPresentableListener {

    weak var router: UsersRouting?
    weak var listener: UsersListener?

    override init(presenter: UsersPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
