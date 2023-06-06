//
//  CommonAPI.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

enum CommonAPI {
  case common(paramter: [String: Any])
}

extension CommonAPI: BaseTarget {
  var parameter: [String : Any?] {
    switch self {
    case let .common(paramter):
      return paramter
    }
  }
  
  var body: [String : Any]? { nil }
  
  var header: [String : String]? { nil }
  
  var method: HttpMethod {
    switch self {
    case .common:
      return .get
    }
  }
  
  var path: String {
    switch self {
    case .common:
      return "/api"
    }
  }
}
