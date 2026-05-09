//
//  CategoryView.swift
//  Gnome Party Companion
//
//

import SwiftUI

struct CategoryView: View {
    let category: EncyclopediaCategory

    var body: some View {
        ZStack {
            Color(red: 0.58, green: 0.82, blue: 0.34)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                Text(category.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 24) {
                    ForEach(category.characters) { character in
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            IconMenuButton(title: character.name, imageName: character.imageName)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
