//
//  NetworkErrorModel.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

struct NetworkErrorModel: Codable {
  public var error: Bool = true
  public var reason: String = "unknown"
}
