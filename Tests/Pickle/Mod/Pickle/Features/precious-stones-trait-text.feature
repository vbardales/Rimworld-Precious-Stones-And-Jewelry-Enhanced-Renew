# Scenario 19 of TEST_SCENARIOS.md: the sentence appended to the Greedy, Jealous and Ascetic trait descriptions, per startup language.
# The sentence is added by a static constructor, so the language is the one the game started with (never switched in a scenario).
# Not played yet (2026-10-28).
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: the trait descriptions say what the mod does

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused

  @english
  Scenario: 19 the three trait descriptions in English
    Then Nelim's Pickle Tools: the trait "Greedy" description contains "especially happy when using weapons and wearing apparel made of precious materials"
    And Nelim's Pickle Tools: the trait "Jealous" description contains "especially happy when using weapons and wearing apparel made of precious materials"
    And Nelim's Pickle Tools: the trait "Ascetic" description contains "doesn't want to use weapons or wear apparel made of precious materials"

  @french
  Scenario: 19 the three trait descriptions in French
    Then Nelim's Pickle Tools: the trait "Greedy" description contains "éprouve aussi une grande satisfaction à manier des armes et à porter des vêtements faits de matériaux précieux"
    And Nelim's Pickle Tools: the trait "Jealous" description contains "éprouve aussi une grande satisfaction à manier des armes et à porter des vêtements faits de matériaux précieux"
    And Nelim's Pickle Tools: the trait "Ascetic" description contains "ne veut pas non plus manier d'armes ni porter de vêtements faits de matériaux précieux"
