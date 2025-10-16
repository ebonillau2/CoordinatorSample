//
//  TabsRoute.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct TabsRoute: View {
  @StateObject private var coordinator = TabsCoordinator()
  
  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.destination(for: .tabs)
        .navigationDestination(for: TabsCoordinator.Route.self) { page in
          coordinator.destination(for: page)
        }
    }
    .environmentObject(coordinator)
  }
}

#Preview {
  TabsRoute()
}
