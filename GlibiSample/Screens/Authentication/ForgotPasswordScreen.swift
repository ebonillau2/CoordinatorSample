//
//  ForgotPasswordScreen.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

struct ForgotPasswordScreen: View {
  @EnvironmentObject private var coordinator: AuthCoordinator
  
  var body: some View {
    VStack {
      Text("Recuperar contraseña")
          .font(.largeTitle)
          .fontWeight(.semibold)
          .padding(.bottom, 20)
      
      Image(systemName: "lock.fill")
          .resizable()
          .frame(width: 50, height: 50)
          .foregroundColor(.blue)
          .padding(.bottom, 40)
      Button {
        coordinator.dismissSheet()
      } label: {
        Text("Regresar")
      }
    }
    
  }
}

#Preview {
  NavigationStack {
    ForgotPasswordScreen()
  }
}
