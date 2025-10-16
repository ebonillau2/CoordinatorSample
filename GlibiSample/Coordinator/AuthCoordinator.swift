//
//  Coordinator.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI
import Combine

final class AuthCoordinator: RouterProtocol, SheetProtocol {
  @Published var sheet: Sheet?
  @Published var path: [Route] = []
  
  @ViewBuilder
  func destination(for screen: Route) -> some View {
    switch screen {
    case .login:
      LoginScreen()
    case .signup:
      SignupScreen()
    case .secondSignup:
      SecondSignupScreen()
    }
  }
  
  @ViewBuilder
  func buildSheet(sheet: Sheet) -> some View {
    switch sheet {
    case .forgotPassword: ForgotPasswordScreen()
    }
  }
}

extension AuthCoordinator {
  enum Route: Hashable {
    case login
    case signup
    case secondSignup
  }

  enum Sheet: String, Identifiable {
    var id: String {
      self.rawValue
    }
    
    case forgotPassword
  }
}
