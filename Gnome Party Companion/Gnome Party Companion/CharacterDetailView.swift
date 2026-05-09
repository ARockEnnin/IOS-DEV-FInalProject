//
//  CharacterDetailView.swift
//  Gnome Party Companion
//
//

import SwiftUI

struct CharacterDetailView: View {
    let character: GnomeCharacter
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                
                VStack(spacing: 16) {
                    Image(character.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                    
                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("\(character.health) Health")
                        .font(.title3)
                        .foregroundStyle(.white.opacity(0.9))
                }
                
                VStack(alignment: .leading, spacing: 18) {
                    
                    Text("Abilities")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    ForEach(character.abilities) { ability in
                        AbilityRow(ability: ability , characterName: character.name)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
        }
        .background(
            Color(red: 0.58, green: 0.82, blue: 0.34)
                .ignoresSafeArea()
        )
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct AbilityRow: View {
    let ability: Ability
    let characterName: String

    @State private var showUpgradePopup = false
    @State private var isShowingUpgrade = false

    var isMage: Bool {
        characterName == "Mage"
    }

    var displayedName: String {
        if isMage, isShowingUpgrade, let upgrade = ability.upgrade {
            return upgrade.name
        }
        return ability.name
    }

    var displayedDescription: String {
        if isMage, isShowingUpgrade, let upgrade = ability.upgrade {
            return upgrade.description
        }
        return ability.description
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top) {
                Image(ability.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .background(Color.white.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading, spacing: 6) {
                    Text(displayedName)
                        .font(.headline)
                        .foregroundStyle(.white)

                    Text(displayedDescription)
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))

                    if !ability.subAbilities.isEmpty {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(ability.subAbilities) { subAbility in
                                HStack(alignment: .top, spacing: 10) {
                                    Image(subAbility.iconName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 28, height: 28)
                                        .background(Color.white.opacity(0.15))
                                        .clipShape(RoundedRectangle(cornerRadius: 6))

                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(subAbility.name)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.white)

                                        Text(subAbility.description)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.8))
                                    }
                                }
                                .padding(.leading, 8)
                            }
                        }
                        .padding(.top, 6)
                    }
                }

                Spacer()

                if ability.upgrade != nil {
                    Button {
                        if isMage {
                            isShowingUpgrade.toggle()
                        } else {
                            showUpgradePopup = true
                        }
                    } label: {
                        Image(systemName: isMage && isShowingUpgrade ? "arrow.down.circle.fill" : "arrow.up.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                }
            }

            if let upgrade = ability.upgrade, !isMage {
                Text("Upgrade: \(upgrade.name)")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)

                Text(upgrade.description)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.8))
            }
        }
        .padding(.vertical, 6)
        .alert("Future Upgrade", isPresented: $showUpgradePopup) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Upgrades will be implemented in the future.")
        }
    }
}
