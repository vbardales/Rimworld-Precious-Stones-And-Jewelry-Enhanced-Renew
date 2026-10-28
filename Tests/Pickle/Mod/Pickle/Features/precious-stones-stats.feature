# Scenarios 16 and 17 of TEST_SCENARIOS.md: the equipped stat offsets of the items. The steps read the pawn's final stat value, so the
# baseline of Miel is part of it (1.0 for social impact and 0 for the suppression offset are the expected baselines, NOT checked yet):
# the first run logs "[stat] value" for each read, and the bounds are calibrated from that log. Not played yet (2026-10-28).
@requires:nelim.pickletools.colonistrace
@timeout:120
Feature: Precious Stones: the stat offsets of the items

  Background:
    Given the save "Nelims-tribe" is loaded
    And game speed is paused

  Scenario: 16 a necklace adds 0.10 social impact
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then Nelim's Pickle Tools: "Miel" stat "SocialImpact" is above 1.05
    And Nelim's Pickle Tools: "Miel" stat "SocialImpact" is below 1.15

  Scenario: 16 beads add 0.05 social impact
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Beads" made of "Jade"
    Then Nelim's Pickle Tools: "Miel" stat "SocialImpact" is above 1.02
    And Nelim's Pickle Tools: "Miel" stat "SocialImpact" is below 1.08

  @requires:ludeon.rimworld.ideology
  Scenario: 17 the necklace lowers slave suppression by 0.10 with Ideology
    When Nelim's Pickle Tools: "Miel" wears "DoctorStupid_Apparel_Necklace" made of "Gold"
    Then Nelim's Pickle Tools: "Miel" stat "SlaveSuppressionOffset" is below -0.05
    And Nelim's Pickle Tools: "Miel" stat "SlaveSuppressionOffset" is above -0.15
