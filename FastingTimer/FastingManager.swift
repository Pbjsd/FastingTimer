//
//  FastingManager.swift
//  FastingTimer
//
//  Created by Panchi on 4/21/24.
//

import Foundation

enum FastingState {
  case notStarted
  case fasting
  case feeding
}
class FastingManager: ObservableObject {
  @Published private(set) var fastingState: FastingState = .notStarted

  func toggleFastingState() {
    fastingState = fastingState == .fasting ? .feeding : .fasting
  }
}
