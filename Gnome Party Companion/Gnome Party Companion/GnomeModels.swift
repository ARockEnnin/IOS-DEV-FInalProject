//
//  GnomeModels.swift
//  Gnome Party Companion
//
//


import SwiftUI

struct Ability: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let iconName: String
    let upgrade: AbilityUpgrade?
    let subAbilities: [Ability]

    init(
        name: String,
        description: String,
        iconName: String,
        upgrade: AbilityUpgrade? = nil,
        subAbilities: [Ability] = []
    ) {
        self.name = name
        self.description = description
        self.iconName = iconName
        self.upgrade = upgrade
        self.subAbilities = subAbilities
    }
}

struct AbilityUpgrade: Hashable {
    let name: String
    let description: String
}

struct GnomeCharacter: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let health: Int
    let imageName: String
    let abilities: [Ability]
}

struct EncyclopediaCategory: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let characters: [GnomeCharacter]
}
