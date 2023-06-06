//
//  UserRepository.swift
//  RIBsUI
//
//  Created by Wimes on 2023/06/06.
//

import Foundation

protocol UserRepository {
  func fetchUsers(_ paramter: UserParamter) async throws -> UserModel
}

final class UserRepositoryImpl: UserRepository {
  func fetchUsers(_ paramter: UserParamter) async throws -> UserModel {
    guard let paramter = paramter.convertToDictnary() else { throw NetworkError.encoding }
    
    let model: UserModel = try await NetworkSession.request(CommonAPI.common(paramter: paramter))
    
    return model
  }
}
