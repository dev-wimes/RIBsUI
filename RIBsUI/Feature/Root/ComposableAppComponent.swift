//
//  ComposableAppComponent.swift
//  SwiftUIInRIBs
//
//  Created by Wimes on 2023/05/29.
//

import RIBs

final class ComposableAppComponent: Component<EmptyDependency>, RootDependency {
  init() {
    super.init(dependency: EmptyComponent())
  }
}
