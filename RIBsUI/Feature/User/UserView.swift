//
//  UserView.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import SwiftUI

struct UserState {
  var names: [String] = []
  var isLoading: Bool = false
}

enum UserAction {
  case onAppear
  case onDisappear
}

protocol UserViewListener: ObservableObject {
  typealias State = UserState
  typealias Action = UserAction
  
  var state: State { get set }
  func send(_ action: Action)
}

struct UserView<I: UserViewListener>: View {
  @StateObject var interactor: I
  
  var body: some View {
    ZStack {
      ScrollView {
        LazyVStack(spacing: 0) {
          ForEach(self.interactor.state.names.indices, id: \.self) { index in
            Text(self.interactor.state.names[index])
              .frame(height: 150, alignment: .center)
          }
        }
      }
      
      if self.interactor.state.isLoading { ProgressView() }
    }
    .onAppear {
      self.interactor.send(.onAppear)
    }
    .onDisappear {
      self.interactor.send(.onDisappear)
    }
  }
}
