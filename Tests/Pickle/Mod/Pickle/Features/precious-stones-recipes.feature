# Scenarios 13, 14 and 15 of TEST_SCENARIOS.md: where the three items are made, what gates them, and which stuffs the default bill allows.
# Read from the definitions the running game holds, no crafting. Colonist-free: the save only supplies a loaded game. Not played yet (2026-10-28).
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: recipes and bills

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused

  Scenario: 13 beads are made early, with no research
    Then Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Beads" is available at "CraftingSpot"
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Beads" is available at "HandTailoringBench"
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Beads" requires no research

  Scenario: 14 the necklace and the pendant need Smithing and Crafting 3
    Then Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Necklace" is available at "FueledSmithy"
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Necklace" requires the research "Smithing"
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Necklace" requires the skill "Crafting" at level 3
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Amulet" is available at "FueledSmithy"
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Amulet" requires the research "Smithing"
    And Nelim's Pickle Tools: the recipe for "DoctorStupid_Apparel_Amulet" requires the skill "Crafting" at level 3

  Scenario: 15 the necklace bill allows gold and silver, not plasteel or uranium
    Then Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Necklace" allows "Gold"
    And Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Necklace" allows "Silver"
    And Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Necklace" does not allow "Plasteel"
    And Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Necklace" does not allow "Uranium"

  Scenario: 15 the pendant and the beads bills allow jade, not plasteel
    Then Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Amulet" allows "Jade"
    And Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Amulet" does not allow "Plasteel"
    And Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Beads" allows "Jade"
    And Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Beads" does not allow "Uranium"

  @requires:ludeon.rimworld.odyssey
  Scenario: 15 obsidian is allowed back in the necklace bill
    Then Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Necklace" allows "Obsidian"

  @requires:ludeon.rimworld.anomaly
  Scenario: 15 bioferrite stays out of the necklace bill
    Then Nelim's Pickle Tools: a bill for "DoctorStupid_Apparel_Necklace" does not allow "Bioferrite"
