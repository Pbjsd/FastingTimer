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

enum FastingPlan: String {
  case beginner = "12:12"
  case intermediate = "16:8"
  case advanced = "20:4"

  var fastingPeriod: Double {
    switch self {
    case .beginner:
      return 12
    case .intermediate:
      return 16
    case .advanced:
      return 20
    }
  }
}

class FastingManager: ObservableObject {
  @Published private(set) var fastingState: FastingState = .notStarted
  @Published private(set) var fastingPlan: FastingPlan = .intermediate

  func toggleFastingState() {
    fastingState = fastingState == .fasting ? .feeding : .fasting
  }
}
