//
//  TabsCoordinator.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI
import Combine

final class TabsCoordinator: RouterProtocol {
  var path: [Route] = []
  
  @ViewBuilder
  func destination(for screen: Route) -> some View {
    switch screen {
    case .tabs:
      TabsScreen()
    }
  }
}

extension TabsCoordinator {
  enum Route: Hashable {
    case tabs
  }
}
