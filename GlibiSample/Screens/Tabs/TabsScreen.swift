//
//  ContentView.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct TabsScreen: View {

  var body: some View {
    TabView {
      Tab("Peliculas", systemImage: "movieclapper") {
        FilmsScreen()
      }
      
      Tab("Favoritos", systemImage: "heart") {
        FavoritesScreen()
      }
      
      Tab("Configuracion", systemImage: "gear") {
        SettingsScreen()
      }
    }
    .setAppearanceTheme()
  }
}

//MARK: - helper to set saved theme

extension View {
  func setAppearanceTheme() -> some View {
    modifier(AppearanceThemeViewModifier())
  }
}

struct AppearanceThemeViewModifier: ViewModifier {
  
  @AppStorage(UserDefaultsKeys.appearanceTheme) private var appearanceTheme: AppearanceTheme = .system
  
  func body(content: Content) -> some View {
    content
      .preferredColorScheme(scheme())
  }
  
  func scheme() -> ColorScheme? {
    switch appearanceTheme {
    case .dark: return .dark
    case .light: return .light
    case .system: return nil
    }
  }
}

#Preview {
  TabsScreen()
}

