# Scenario 22 of TEST_SCENARIOS.md: the items of another jewellery mod count when they are made of a stuff.
# Optional integration pass: D4egon's Jewelry (D4egon.D4egonsJewlry, Workshop 3757128869) staged beside the mod.
# D4J_DarkRing is Metallic and sits on the right hand, so it does not clash with a neck piece. Not played yet (2026-10-28).
@requires:D4egon.D4egonsJewlry @requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: the items of other jewellery mods

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: "Miel" has no trait "Greedy"
    And Nelim's Pickle Tools: "Miel" has no trait "Jealous"
    And Nelim's Pickle Tools: "Miel" has no trait "Ascetic"

  Scenario: 22 a dark ring made of gold is three points
    When Nelim's Pickle Tools: "Miel" wears "D4J_DarkRing" made of "Gold"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 2.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 3.5
    And no errors were logged

  Scenario: 22 the ring adds to a gold necklace
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    And Nelim's Pickle Tools: "Miel" wears "D4J_DarkRing" made of "Gold"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 5.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 6.5
