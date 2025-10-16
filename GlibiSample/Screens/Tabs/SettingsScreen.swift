//
//  SettingsScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct SettingsScreen: View {
  @Environment(AuthManager.self) private var authManager
  @AppStorage(UserDefaultsKeys.appearanceTheme)
  private var appearanceTheme: AppearanceTheme = .system
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          Picker("Appearance", selection: $appearanceTheme) {
            ForEach(AppearanceTheme.allCases) {
              Text($0.rawValue.capitalized)
            }
          }
          .pickerStyle(.inline)
          .labelsHidden()
        } header: {
          Text("Modo")
        } footer: {
          Text("Anula la apariencia del sistema para usar siempre el modo claro.")
        }
        Section {
          Button(role: .confirm) {
            authManager.currentUser = false
          } label: {
            Text("Cerrar Sesion")
          }
        }
      }
    }
    .navigationTitle("Configuracion")
  }
}

//MARK: - helper to save user defaults keys and keep them unique

enum UserDefaultsKeys {
  static let appearanceTheme = "appearanceTheme"
}

//MARK: - data model for appearance

enum AppearanceTheme: String, Identifiable, CaseIterable {
  case system = "Sistema"
  case light = "Claro"
  case dark = "Oscuro"
  var id: Self { return self }
}

#Preview {
  NavigationStack {
    SettingsScreen()
      .environment(AuthManager())
  }
}
