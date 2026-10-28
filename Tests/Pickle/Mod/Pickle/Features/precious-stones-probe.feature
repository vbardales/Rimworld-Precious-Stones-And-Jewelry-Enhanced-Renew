# One scenario that tells whether the Backlot's colonists load with the minimal pass map, and whether the new steps work at all.
# Played alone first (-Filter "@probe"); read Player.log for missing-def warnings. Not played yet (2026-10-28).
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones probe

  @probe
  Scenario: probe: a silver necklace on Miel gives one point
    Given the save "Nelims-tribe" is loaded
    And game speed is paused
    And Nelim's Pickle Tools: "Miel" has no trait "Greedy"
    And Nelim's Pickle Tools: "Miel" has no trait "Jealous"
    And Nelim's Pickle Tools: "Miel" has no trait "Ascetic"
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Silver"
    Then "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is above 0.5
    And "Miel" thought "DoctorStupid_ShinyEquipment" mood offset is below 1.5
    And Nelim's Pickle Tools: "Miel" thought "DoctorStupid_ShinyEquipment" label contains "silver"
    And no errors were logged
