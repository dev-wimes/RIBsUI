//
//  Encodable+.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

extension Encodable {
  func convertToDictnary() -> [String: Any]? {
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(self) {
      let dictionary = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any]
      return dictionary
    }

    return nil
  }
}
