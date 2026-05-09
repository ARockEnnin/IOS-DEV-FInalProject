//
//  GnomeData.swift
//  Gnome Party Companion
//
//

import SwiftUI

struct GnomeData {
    static let categories: [EncyclopediaCategory] = [
        EncyclopediaCategory(
            title: "Player Classes",
            imageName: "pc logo",
            characters: [warrior, bard, mage]
        ),
        EncyclopediaCategory(
            title: "Easy Enemy Pool",
            imageName: "easy logo",
            characters: [skeletonWarrior, goblinArcher, forestSprite]
        ),
        EncyclopediaCategory(
            title: "Difficult Enemy Pool",
            imageName: "difficult logo",
            characters: [gnombieBrute, caveBats]
        ),
        EncyclopediaCategory(
            title: "Boss Pool",
            imageName: "boss logo",
            characters: [necrognomancer, gnomeEater]
        )
    ]
    
    static let warrior = GnomeCharacter(
        name: "Warrior",
        health: 30,
        imageName: "warrior",
        abilities: [
            Ability(
                name: "Slash",
                description: "Deal 10 damage to a target enemy.",
                iconName: "physical attack",
                upgrade: AbilityUpgrade(
                    name: "Precise Strike",
                    description: "Deal 12 damage to a target enemy."
                )
            ),
            Ability(
                name: "Block",
                description: "Target an ally. Any attacks targeting that ally hit you instead until the beginning of the next turn. You take 50% less damage until the beginning of the next turn.",
                iconName: "block",
                upgrade: AbilityUpgrade(
                    name: "Expert Guard",
                    description: "Target an ally. Any attacks targeting that ally hit you instead until the beginning of the next turn. You take 75% less damage until the beginning of the next turn."
                )
            ),
            Ability(
                name: "Parry",
                description: "Target an enemy. Take no damage from that enemy this turn.",
                iconName: "block",
                upgrade: AbilityUpgrade(
                    name: "Counter",
                    description: "Target an enemy. Take no damage from that enemy this turn. If it attacks you, deal 6 damage to it."
                )
            ),
            Ability(
                name: "Whirling Strike",
                description: "Deal 5 damage to all enemies.",
                iconName: "physical attack",
                upgrade: AbilityUpgrade(
                    name: "Devastating Cleave",
                    description: "Deal 8 damage to all enemies."
                )
            )
        ]
    )
    
    static let bard = GnomeCharacter(
        name: "Bard",
        health: 25,
        imageName: "bard",
        abilities: [
            Ability(
                name: "Discord",
                description: "Deal 8 damage to a target enemy. Reset your Song to “Soothing Song.”",
                iconName: "discord",
                upgrade: AbilityUpgrade(
                    name: "Menacing Note",
                    description: "Deal 8 damage to a target enemy. That enemy takes 25% more damage for the rest of this turn. Reset your Song to “Soothing Song.”"
                )
            ),
            Ability(
                name: "Song",
                description: "After each use, progresses to the next Song.",
                iconName: "bard weapon",
                subAbilities: [
                    Ability(
                        name: "Soothing Song",
                        description: "Target an ally. That ally heals 8 health. Replace this with “Inspiring Song”.",
                        iconName: "soothing song"
                    ),
                    Ability(
                        name: "Inspiring Song",
                        description: "Target an ally. That ally deals 50% increased damage this turn. Replace this with “Frightening Song”.",
                        iconName: "inspire"
                    ),
                    Ability(
                        name: "Frightening Song",
                        description: "Target an enemy. That enemy is stunned this turn. Replace this with “Soothing Song”.",
                        iconName: "frightening song"
                    )
                ]
            ),
            Ability(
                name: "Power Chord",
                description: "Applies the effect of your song to all allies/enemies and stuns you for the next turn",
                iconName: "power cord",
                upgrade: AbilityUpgrade(
                    name: "Crescendo",
                    description: "Applies the effect of your song to all allies/enemies and you cannot use your Song for the next turn."
                )
            ),
            Ability(
                name: "Mockery",
                description: "Deal 6 damage to a target enemy. That enemy will target you this turn.",
                iconName: "mockery",
                upgrade: AbilityUpgrade(
                    name: "Debilitating Insult",
                    description: "Deal 6 damage to a target enemy. That enemy will target you this turn and deals 50% less damage."
                )
            )
        ]
    )
    static let mage = GnomeCharacter(
        name: "Mage",
        health: 20,
        imageName: "mage",
        abilities: [
            Ability(
                name: "Magic Missile",
                description: "Deal 10 damage to a target enemy. It cannot be blocked, dodged, or have its damage reduced.",
                iconName: "magic missile",
                upgrade: AbilityUpgrade(
                    name: "Vaporizing Beam",
                    description: "Deal 13 damage to a target enemy. It cannot be blocked, dodged, or have its damage reduced."
                )
            ),
            
            Ability(
                name: "Fireball",
                description: "Deal 6 damage to a target enemy and burn the target and adjacent enemies.",
                iconName: "fireball",
                upgrade: AbilityUpgrade(
                    name: "Chain Lightning",
                    description: "Deal 8 damage to a target enemy and burn the target and adjacent enemies."
                )
            ),
            
            Ability(
                name: "Ice Ray",
                description: "Deal 5 damage to a target enemy. That enemy deals 50% less damage this turn.",
                iconName: "ice ray",
                upgrade: AbilityUpgrade(
                    name: "Blizzard",
                    description: "Deal 5 damage to 2 target enemies. Those enemies deal 50% less damage this turn."
                )
            ),
            
            Ability(
                name: "Mirror",
                description: "Target an enemy. The spell you cast next turn will be cast again on this enemy.",
                iconName: "mirror"
            )
        ]
    )
    static let skeletonWarrior = GnomeCharacter(
        name: "Skeleton Warrior",
        health: 20,
        imageName: "skeleton",
        abilities: [
            Ability(
                name: "Bone Slash",
                description: "Deals 6 damage to a single player.",
                iconName: "physical attack"
            ),
            
            Ability(
                name: "Rattle Guard",
                description: "Reduces incoming damage by 50% until the next turn.",
                iconName: "block"
            )
        ]
    )
    static let goblinArcher = GnomeCharacter(
        name: "Goblin Archer",
        health: 15,
        imageName: "goblin",
        abilities: [
            Ability(
                name: "Piercing Arrow",
                description: "Deals 8 damage to a player. This attack cannot be redirected by Block.",
                iconName: "arrow"
            ),
            
            Ability(
                name: "Crippling Shot",
                description: "Deals 4 damage and reduces the target’s damage by 25% next turn.",
                iconName: "arrow"
            )
        ]
    )
    static let forestSprite = GnomeCharacter(
        name: "Forest Sprite",
        health: 12,
        imageName: "forest",
        abilities: [
            Ability(
                name: "Entangle",
                description: "Stun a target for 1 turn.",
                iconName: "physical attack"
            ),
            
            Ability(
                name: "Leaf Dart",
                description: "Deal 4 damage twice, targeting random players.",
                iconName: "leaf dart"
            )
        ]
    )
    static let gnombieBrute = GnomeCharacter(
        name: "Gnombie Brute",
        health: 30,
        imageName: "gnombie",
        abilities: [
            Ability(
                name: "Heavy Slam",
                description: "Deal 12 damage.",
                iconName: "physical attack"
            ),
            
            Ability(
                name: "Rotting Aura",
                description: "Apply +2 damage-taken debuff to a random player.",
                iconName: "rotting"
            )
        ]
    )
    static let caveBats = GnomeCharacter(
        name: "Cave Bats",
        health: 9,
        imageName: "bat",
        abilities: [
            Ability(
                name: "Sonic Squeal",
                description: "Deal 3 damage to all players.",
                iconName: "roar"
            ),
            
            Ability(
                name: "Blood Peck",
                description: "Deal 5 damage to a single target. If the target is below 30% health, restore 3 health to the Bat.",
                iconName: "physical attack"
            )
        ]
    )
    static let necrognomancer = GnomeCharacter(
        name: "Necrognomancer",
        health: 40,
        imageName: "necrognomancer",
        abilities: [
            Ability(
                name: "Dark Bolt",
                description: "Deal 10 damage.",
                iconName: "dark bolt"
            ),
            
            Ability(
                name: "Soul Drain",
                description: "Deal 6 damage to all players and heal for the total.",
                iconName: "soul drain"
            ),
            
            Ability(
                name: "Summon",
                description: "Summon a weakened easy enemy pool ally.",
                iconName: "summon"
            )
        ]
    )
    static let gnomeEater = GnomeCharacter(
        name: "The Gnome Eater",
        health: 55,
        imageName: "gnome eater",
        abilities: [
            Ability(
                name: "Crushing Swipe",
                description: "Deal 14 damage to a single target.",
                iconName: "physical attack"
            ),
            
            Ability(
                name: "Devour Essence",
                description: "Deal 8 damage to a target and heal for 8.",
                iconName: "soul drain"
            ),
            
            Ability(
                name: "Primal Roar",
                description: "All players deal 25% less damage next turn.",
                iconName: "roar"
            ),
            
            Ability(
                name: "Ravenous Growth",
                description: "Increase the Gnome Eater’s damage by +2 permanently.",
                iconName: "ravenous"
            )
        ]
    )
}
