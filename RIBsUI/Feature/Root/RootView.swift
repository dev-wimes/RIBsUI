//
//  RootView.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import SwiftUI

struct RootState {
  
}

enum RootAction {
  case didTapText
}

protocol RootViewListener: ObservableObject {
  typealias State = RootState
  typealias Action = RootAction
  
  var state: State { get set }
  func send(_ action: Action)
}

struct RootView<I: RootViewListener>: View {
  @StateObject var interactor: I
  
  var body: some View {
    Text("Hello World!")
      .onTapGesture {
        self.interactor.send(.didTapText)
      }
  }
}
