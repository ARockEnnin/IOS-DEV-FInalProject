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

                UpsideDownTriangleOptions(characters: category.characters)

                Spacer()
            }
            .padding()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct UpsideDownTriangleOptions: View {
    let characters: [GnomeCharacter]

    var body: some View {
        VStack(spacing: 24) {
            if characters.count >= 2 {
                HStack(spacing: 48) {
                    characterButton(characters[0])
                    characterButton(characters[1])
                }
            }

            if characters.count >= 3 {
                characterButton(characters[2])
            }

            if characters.count == 1 {
                characterButton(characters[0])
            }

            if characters.count == 2 {
                HStack(spacing: 48) {
                    characterButton(characters[0])
                    characterButton(characters[1])
                }
            }
        }
    }

    func characterButton(_ character: GnomeCharacter) -> some View {
        NavigationLink {
            CharacterDetailView(character: character)
        } label: {
            IconMenuButton(title: character.name, imageName: character.imageName)
                .frame(width: 140)
        }
    }
}
