# Scenario 20b of TEST_SCENARIOS.md: what {PAWN_pronoun} resolves to in the French trait sentences for a colonist with no gender.
# The assertion only checks that the sentence is there; the pronoun itself is read from the "[trait] <name> <trait> gender None" log line of the
# run (the step logs the resolved text), then judged by the owner: this scenario FINDS OUT the form, it cannot know it. Not played yet (2026-10-28).
@french
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: the pronoun of the French trait sentences for a colonist with no gender

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused

  Scenario: 20b greedy, no gender
    Given Nelim's Pickle Tools: "Miel" has the trait "Greedy"
    And Nelim's Pickle Tools: "Miel" gender is neutral
    Then Nelim's Pickle Tools: "Miel" trait "Greedy" description contains "éprouve aussi une grande satisfaction"

  Scenario: 20b jealous, no gender
    Given Nelim's Pickle Tools: "Miel" has the trait "Jealous"
    And Nelim's Pickle Tools: "Miel" gender is neutral
    Then Nelim's Pickle Tools: "Miel" trait "Jealous" description contains "éprouve aussi une grande satisfaction"

  Scenario: 20b ascetic, no gender
    Given Nelim's Pickle Tools: "Miel" has the trait "Ascetic"
    And Nelim's Pickle Tools: "Miel" gender is neutral
    Then Nelim's Pickle Tools: "Miel" trait "Ascetic" description contains "ne veut pas non plus"
