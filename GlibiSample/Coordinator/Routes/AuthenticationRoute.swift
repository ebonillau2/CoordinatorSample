//
//  CoordinatorView.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct AuthenticationRoute: View {
  @StateObject private var coordinator = AuthCoordinator()
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.destination(for: .login)
        .navigationDestination(for: AuthCoordinator.Route.self) { page in
          coordinator.destination(for: page)
        }
        .sheet(item: $coordinator.sheet) { sheet in
          coordinator.buildSheet(sheet: sheet)
        }
    }
    .environmentObject(coordinator)
  }
}

#Preview {
  AuthenticationRoute()
}
