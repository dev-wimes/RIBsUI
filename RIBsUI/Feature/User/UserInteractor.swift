//
//  UsersInteractor.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import RIBs
import RxSwift
import SwiftUI

protocol UserRouting: ViewableRouting {
}

protocol UserListener: AnyObject {
  func detachUser()
}

protocol UserInteractorDependency {
  var repository: UserRepository { get }
}

final class UserInteractor: Interactor,
                             UserInteractable,
                             UserViewListener {
  
  weak var router: UserRouting?
  weak var listener: UserListener?
  
  private let dependency: UserInteractorDependency
  
  @Published var state: UserState = .init()
  
  init(dependency: UserInteractorDependency) {
    self.dependency = dependency
    
    super.init()
  }
  
  override func didBecomeActive() { super.didBecomeActive() }
  
  override func willResignActive() { super.willResignActive() }
}

extension UserInteractor {
  func send(_ action: Action) {
    switch action {
    case .onAppear:
      Task { @MainActor in
        self.state.isLoading = true
        let users = try await self.dependency.repository.fetchUsers(.init(results: 30))
        self.state.isLoading = false
        self.state.names += users.results.map { $0.name.first }
      }
    case .onDisappear:
      self.listener?.detachUser()
    }
  }
}
