# Scenarios 1 to 12 of TEST_SCENARIOS.md: the mood thoughts driven by the material of worn and held things.
# Colonist: Miel of Nelim's Sanctuary Backlot (save Nelims-tribe), traits reset for each scenario. Mood offset steps are strict,
# so +4 is "above 3.5" and "below 4.5". Not played yet (2026-10-28).
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: the beauty of the stuff scores a mood thought

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: "Miel" has no trait "Greedy"
    And Nelim's Pickle Tools: "Miel" has no trait "Jealous"
    And Nelim's Pickle Tools: "Miel" has no trait "Ascetic"

  Scenario: 1 a silver necklace is one point
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 0.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 1.5
    And no errors were logged

  Scenario: 2 a gold necklace is glistening, three points
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 2.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 3.5
    And no errors were logged

  Scenario: 3 a jade pendant is one point
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Amulet" made of "Jade"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 0.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 1.5

  @requires:ludeon.rimworld.odyssey
  Scenario: 4 an obsidian necklace is one point
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Obsidian"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 0.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 1.5

  Scenario: 5 a silver knife in hand counts
    When Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 0.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 1.5

  Scenario: 6 points add up across the neck and the hand
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    And Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 3.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 4.5

  Scenario: 7 the plain thought stops at six
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    And Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Gold"
    And Nelim's Pickle Tools: "Miel" wears "Apparel_SimpleHelmet" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 5.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 6.5

  Scenario: 8 steel scores nothing
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Steel"
    And Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Steel"
    Then Nelim's Pickle Tools: "Miel" has no thought "DoctorStupid_ShinyEquipment"

  Scenario: 9 a greedy colonist gets the second thought on top
    Given Nelim's Pickle Tools: "Miel" has the trait "Greedy"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 2.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 3.5
    And "Miel" thought "DoctorStupid_ShinyEquipment_Greedy" mood offset is above 4.5
    And "Miel" thought "DoctorStupid_ShinyEquipment_Greedy" mood offset is below 5.5

  Scenario: 10 a jealous colonist gets it too
    Given Nelim's Pickle Tools: "Miel" has the trait "Jealous"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then "Miel" thought "DoctorStupid_ShinyEquipment_Greedy" mood offset is above 4.5
    And "Miel" thought "DoctorStupid_ShinyEquipment_Greedy" mood offset is below 5.5

  Scenario: 11 an ascetic colonist gets the penalty and no bonus
    Given Nelim's Pickle Tools: "Miel" has the trait "Ascetic"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" mood offset is below -4.5
    And "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" mood offset is above -5.5
    And Nelim's Pickle Tools: "Miel" has no thought "DoctorStupid_ShinyEquipment"

  Scenario: 12 the ascetic penalty is flat
    Given Nelim's Pickle Tools: "Miel" has the trait "Ascetic"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    And Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" mood offset is below -4.5
    And "Miel" thought "DoctorStupid_ShinyEquipment_Ascetic" mood offset is above -5.5

  @english
  Scenario: 18 the mood tab label in English
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment" label contains "glistening"
    When Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Silver"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment" label contains ", etc"

  @french
  Scenario: 18 the mood tab label in French
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment" label contains "scintillement :"
    When Nelim's Pickle Tools: "Miel" wields "MeleeWeapon_Knife" made of "Silver"
    Then Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment" label contains ", etc."
