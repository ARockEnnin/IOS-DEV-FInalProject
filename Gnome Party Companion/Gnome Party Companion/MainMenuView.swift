//
//  MainMenuView.swift
//  Gnome Party Companion
//
//

import SwiftUI

struct MainMenuView: View {
    let categories = GnomeData.categories

    var body: some View {
        ZStack {
            Color(red: 0.58, green: 0.82, blue: 0.34)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text("Gnome Party\nEncyclopedia")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)

                Text("Choose a section")
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.85))

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(categories) { category in
                        NavigationLink {
                            CategoryView(category: category)
                        } label: {
                            IconMenuButton(title: category.title, imageName: category.imageName)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(false)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .navigationTitle("")
    }
}

struct IconMenuButton: View {
    let title: String
    let imageName: String

    var body: some View {
        VStack(spacing: 12) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundStyle(.white)
        }
        .padding()
        .background(Color.white.opacity(0.18))
        .clipShape(RoundedRectangle(cornerRadius: 18))
    }
}
