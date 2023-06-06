//
//  UsersViewController.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs
import RxSwift
import UIKit

protocol UsersPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class UsersViewController: UIViewController, UsersPresentable, UsersViewControllable {

    weak var listener: UsersPresentableListener?
}
