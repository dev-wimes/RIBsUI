//
//  Task+.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

extension Task where Failure == Error {
  static func retry(
    priority: TaskPriority? = nil,
    maxRetryCount: Int = 3,
    operation: @Sendable @escaping () async throws -> Success
  ) -> Self {
    return Task(priority: priority) {
      for _ in 0 ..< maxRetryCount {
        do { return try await operation() }
        catch { continue }
      }

      try Task<Never, Never>.checkCancellation()
      return try await operation()
    }
  }
}
