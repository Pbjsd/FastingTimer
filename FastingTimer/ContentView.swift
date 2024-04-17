//
//  ContentView.swift
//  FastingTimer
//
//  Created by Panchi on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        // MARK: Background

        Color(#colorLiteral(red: 0.05024140328, green: 0.006751002744, blue: 0.08163713664, alpha: 1))
          .ignoresSafeArea()

        content
        }
    }

  var content: some View {
    VStack {
      // MARK: Progress Ring

      ProgressRing()
    }
  }
}

#Preview {
    ContentView()
}
