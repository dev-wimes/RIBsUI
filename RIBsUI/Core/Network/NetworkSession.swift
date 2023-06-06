//
//  NetworkSession.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

final class NetworkSession {
  private static let session = URLSession.shared
  
  static func request<T: Decodable>(_ targetAPI: BaseTarget, maximumRetryCount: Int = 1) async throws -> T {
    let request = self.createURLRequest(targetAPI)
    debugPrint("## request.url: ", request.url)
    do {
      return try await Task.retry(maxRetryCount: maximumRetryCount) {
        try await self.perform(request)
      }.value
    } catch {
      throw NetworkError.maximumCallExceeded(error)
    }
  }
  
  private static func perform<T: Decodable>(_ request: URLRequest, shouldRefresh: Bool = true) async throws -> T {
    do {
      let (data, response) = try await self.session.data(for: request)
      
      guard let httpResponse = response as? HTTPURLResponse
      else { throw NetworkError.unknown }
      
      switch httpResponse.statusCode {
        // 성공
      case 200 ..< 300:
        break
        // 실패
      case 404:
        throw NetworkError.notFound
      default:
        guard (try? JSONDecoder().decode(NetworkErrorModel.self, from: data)) != nil else {
          throw NetworkError.unknown
        }
        throw NetworkError.serverError
      }
      
      if let data = data as? T { return data }
      guard let model = try? JSONDecoder().decode(T.self, from: data) else {
        throw (NetworkError.parsing)
      }

      return model
      
    } catch {
      throw (NetworkError.badRequest)
    }
  }
  
  private static func createURLRequest(_ targetAPI: BaseTarget) -> URLRequest {
    var request = URLRequest(url: targetAPI.url)
    request.httpMethod = targetAPI.method.rawValue
    
    let defaultHeader: [String: String] = ["Content-Type":"application/json"]
    defaultHeader.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
    if let header = targetAPI.header {
      header.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
    }
    
    if let body = targetAPI.body {
      guard let jsonData = try? JSONSerialization.data(withJSONObject: body) else {
        assertionFailure("JsonData로 형변환에 실패했습니다.")
        return request
      }
      request.httpBody = jsonData
    }
    
    return request
  }
}
