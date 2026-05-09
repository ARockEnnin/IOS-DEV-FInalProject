//
//  SearchView.swift
//  Gnome Party Companion
//
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var allCharacters: [GnomeCharacter] {
        GnomeData.categories.flatMap { $0.characters }
    }

    var filteredCharacters: [GnomeCharacter] {
        if searchText.isEmpty {
            return allCharacters
        } else {
            return allCharacters.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        ZStack {
            Color(red: 0.58, green: 0.82, blue: 0.34)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("Search Characters")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)

                TextField("Search Warrior, Mage, Skeleton...", text: $searchText)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 14) {
                        ForEach(filteredCharacters) { character in
                            NavigationLink {
                                CharacterDetailView(character: character)
                            } label: {
                                HStack(spacing: 16) {
                                    Image(character.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .background(Color.white.opacity(0.15))
                                        .clipShape(RoundedRectangle(cornerRadius: 12))

                                    VStack(alignment: .leading) {
                                        Text(character.name)
                                            .font(.headline)
                                            .foregroundStyle(.white)

                                        Text("\(character.health) Health")
                                            .font(.subheadline)
                                            .foregroundStyle(.white.opacity(0.85))
                                    }

                                    Spacer()
                                }
                                .padding()
                                .background(Color.white.opacity(0.15))
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("")
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
