//
//  NetworkError.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

enum NetworkError: Error {
  case unknown
  case serverError
  case badRequest // 400
  case parsing
  case encoding
  case notFound // 404
  case maximumCallExceeded(_ error: Error)
}

extension NetworkError {
  func toNetworkErrorModel() -> NetworkErrorModel {
    switch self {
    default:
      return .init(error: true, reason: self.localizedDescription)
    }
  }
}
