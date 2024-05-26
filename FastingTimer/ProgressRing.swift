//
//  ProgressRingView.swift
//  FastingTimer
//
//  Created by Panchi on 4/17/24.
//

import SwiftUI

struct ProgressRing: View {
  @EnvironmentObject var fastingManager: FastingManager

  let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

  var body: some View {
    ZStack {
      // MARK: Placeholder Ring

      Circle()
        .stroke(lineWidth: 20)
        .foregroundColor(.gray)
        .opacity(0.1)

      // MARK: Colored Ring

      Circle()
        .trim(from: 0.0, to: min(fastingManager.progress, 1.0))
        .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4605398178, green: 0.5195819736, blue: 1, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.5112044811, blue: 0.8496307731, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8162222505, blue: 0.9327233434, alpha: 1)), Color(#colorLiteral(red: 0.757700026, green: 0.9950782657, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.4605398178, green: 0.5195819736, blue: 1, alpha: 1))]), center: .center), style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
        .rotationEffect((Angle(degrees: 270)))
        .animation(.easeInOut(duration: 1.0), value: fastingManager.progress)

      VStack(spacing: 30) {
        if fastingManager.fastingState == .notStarted {
          // MARK: Upcoming Fast 

          VStack(spacing: 5) {
            Text("Upcoming fast")
              .opacity(0.7)

            Text("\(fastingManager.fastingPlan.fastingPeriod.formatted()) Hours")
              .font(.title)
              .fontWeight(.bold)
          }
        } else {
          // MARK: Elapsed Time

          VStack(spacing: 5) {
            Text("Elapsed time (\(fastingManager.progress.formatted(.percent)))")
              .opacity(0.7)

            Text(fastingManager.startTime, style: .timer)
              .font(.title)
              .fontWeight(.bold)
          }
          .padding(.top)

          // MARK: Remaining Time

          VStack(spacing: 5) {
            if !fastingManager.elapsed {
              Text("Remaining time (\((1 - fastingManager.progress).formatted(.percent)))")
                .opacity(0.7)
            } else {
              Text("Extra time")
                .opacity(0.7)
            }

            Text(fastingManager.endTime, style: .timer)
              .font(.title2)
              .fontWeight(.bold)
          }
        }
      }
    }
      .frame(width: 250, height: 250)
      .padding()
//      .onAppear {
//        fastingManager.progress = 1
//      }
      .onReceive(timer) { _ in
        fastingManager.track()
      }
    }
  }

  struct ProgressRing_Previews: PreviewProvider {
    static var previews: some View {
      ProgressRing()
        .environmentObject(FastingManager())
    }
  }

