//
//  Coordinator.swift
//  GlibiSample
//
//  Created by Enrique Bonilla on 16/10/25.
//

import SwiftUI

protocol RouterProtocol: ObservableObject {
  associatedtype Route: Hashable
  var path: [Route] { get set }
  
  associatedtype RouteView: View
  @ViewBuilder
  func destination(for route: Route) -> RouteView
  
  func push(page: Route)
  func pop()
  func popToRoot()
}

protocol SheetProtocol: ObservableObject {
  associatedtype Sheet: Hashable
  var sheet: Sheet? { get set }
  
  associatedtype SheetView: View
  @ViewBuilder
  func buildSheet(sheet: Sheet) -> SheetView
  
  func presentSheet(_ sheet: Sheet)
  func dismissSheet()
}

protocol FullScreenCoverProtocol: ObservableObject {
  associatedtype FullScreenCover: Hashable
  var fullScreenCover: FullScreenCover? { get set }
  
  associatedtype FullScreenCoverView: View
  @ViewBuilder
  func buildCover(cover: FullScreenCover) -> FullScreenCoverView
  
  func presentFullScreenCover(_ cover: FullScreenCover)
  func dismissCover()
}

typealias CoordinatorProtocol = RouterProtocol & SheetProtocol & FullScreenCoverProtocol

extension RouterProtocol {
  func push(page: Route) {
    path.append(page)
  }
  
  func pop() {
    path.removeLast()
  }
  
  func popToRoot() {
    path.removeLast(path.count)
  }
}

extension SheetProtocol {
  func presentSheet(_ sheet: Sheet) {
    self.sheet = sheet
  }
  
  func dismissSheet() {
    self.sheet = nil
  }
}

extension FullScreenCoverProtocol {
  func presentFullScreenCover(_ cover: FullScreenCover) {
    self.fullScreenCover = cover
  }

  func dismissCover() {
    self.fullScreenCover = nil
  }
}


