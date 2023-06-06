//
//  BaseTarget.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

protocol BaseTarget {
  var parameter: [String: Any?] { get }
  var path: String { get }
  var body: [String: Any]? { get }
  var header: [String: String]? { get }
  var method: HttpMethod { get }
}

extension BaseTarget {
  var baseUrl: String {
    return NetworkKey.baseURL
  }

  var url: URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = self.baseUrl
    components.path = self.path
    components.queryItems = []

    self.parameter.forEach {
      if let value = $0.value {
        components.queryItems?.append(URLQueryItem(
          name: $0.key,
          value: "\(value)"
        ))
      }
    }

    if let url = components.url {
      return url
    } else {
      return URL(string: "")!
    }
  }

  var body: [String: Any]? {
    return nil
  }
}
