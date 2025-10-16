//
//  ContentView.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct ContentView: View {
  @State private var authManager = AuthManager()
  
  var body: some View {
    ZStack {
      if liveSession() {
        TabsRoute()
      } else {
        AuthenticationRoute()
      }
    }
    .animation(.default, value: liveSession())
    .environment(authManager)
  }
}

private extension ContentView {
  func liveSession() -> Bool {
    authManager.currentUser
  }
}

#Preview {
  ContentView()
}
