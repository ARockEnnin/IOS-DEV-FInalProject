//
//  LandingView.swift
//  Gnome Party Companion
//
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack {
            Color(red: 0.58, green: 0.82, blue: 0.34)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Spacer()

                Image("gp logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260, height: 140)
                    .clipShape(RoundedRectangle(cornerRadius: 18))

                Text("GNOME PARTY")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                NavigationLink {
                    MainMenuView()
                } label: {
                    Text("BEGIN")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.45))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}
