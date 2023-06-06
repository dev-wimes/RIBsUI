//
//  RootInteractor.swift
//  SwiftUIInRIBs
//
//  Created by Wimes on 2023/05/29.
//

import RIBs
import RxSwift
import SwiftUI

protocol RootRouting: ViewableRouting {
  func attachUser()
  func detachUser()
}

protocol RootListener: AnyObject { }

protocol RootInteractorDependency {
  
}

final class RootInteractor: Interactor, // MARK: Presenter가 필요없어지기 때문에 Interactor만 채택한다.
                            RootInteractable,
                            RootViewListener {
  
  weak var router: RootRouting?
  weak var listener: RootListener?
  
  private let dependency: RootInteractorDependency
  
  @Published var state: RootState = .init()
  
  init(dependency: RootInteractorDependency) {
    self.dependency = dependency
    
    super.init()
  }
  
  override func didBecomeActive() { super.didBecomeActive() }
  
  override func willResignActive() { super.willResignActive() }
}

extension RootInteractor {
  func send(_ action: Action) {
    switch action {
    case .didTapText:
      self.router?.attachUser()
    }
  }
}

extension RootInteractor {
  func detachUser() {
    self.router?.detachUser()
  }
}
