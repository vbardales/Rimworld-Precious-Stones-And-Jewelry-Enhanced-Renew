# Scenario 20 of TEST_SCENARIOS.md: the French thought texts that agree with the colonist: couvert, couverte, couvertx.
# The gender is set FIRST (it changes body and head), then the thought is read. The step puts gender, body and head back after each scenario.
# The Ascetic thought needs one point; the Greedy stage 1 text needs two points, so a silver necklace and a silver knife.
# Miel is read as a woman by the Backlot canon; the male case sets her gender to male for the scenario. Not played yet (2026-10-28).
@french
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: the French agreement of the thought texts

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: "Miel" has no trait "Greedy"
    And Nelim's Pickle Tools: "Miel" has no trait "Jealous"

  Scenario: 20 ascetic, masculine: couvert
    Given Nelim's Pickle Tools: "Miel" gender is male
    And Nelim's Pickle Tools: "Miel" has the trait "Ascetic"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" description contains "couvert de gemmes"

  Scenario: 20 ascetic, feminine: couverte
    Given Nelim's Pickle Tools: "Miel" gender is female
    And Nelim's Pickle Tools: "Miel" has the trait "Ascetic"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" description contains "couverte de gemmes"

  Scenario: 20 ascetic, neutral: couvertx
    Given Nelim's Pickle Tools: "Miel" gender is neutral
    And Nelim's Pickle Tools: "Miel" has the trait "Ascetic"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" description contains "couvertx de gemmes"

  Scenario: 20 greedy, neutral: couvertx de richesses
    Given Nelim's Pickle Tools: "Miel" gender is neutral
    And Nelim's Pickle Tools: "Miel" has the trait "Greedy"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    And Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Silver"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment_Greedy" description contains "couvertx de richesses"
