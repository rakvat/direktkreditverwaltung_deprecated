Feature: The Direktkreditverwaltung should produce the same results as were calculated in previous years using
  the syndikat excel sheet for DKs

Scenario: Anonymized DK data from the zolle11 in year 2011
  Given The date is "2011-01-01"
    And DK contract 1 has a balance of 8852.58 euro and interest of 3.0%
    And DK contract 2 has a balance of 1644.23 euro and interest of 1.5%
    And DK contract 6 has a balance of 1526.11 euro and interest of 1.0%

  When Time passes
    And For DK contract 1 a deposit of 1000.00 euro is made on the "2011-01-17"
    And For DK contract 1 a deposit of 200.00 euro is made on the "2011-01-20"
    And For DK contract 1 a deposit of 200.00 euro is made on the "2011-02-09"
    And For DK contract 1 a payback of 500.00 euro is made on the "2011-01-13"
    And For DK contract 1 a payback of 400.00 euro is made on the "2011-03-04"
    And For DK contract 1 a payback of 600.00 euro is made on the "2011-07-13"

    And For DK contract 6 a payback of 1526.11 euro is made on the "2011-05-26"
    And For DK contract 6 a payback of 6.15 euro is made on the "2011-05-26"

  Then Time passes and it is the "2011-12-31"
    And The balance including interest of DK contract 1 is 9528.29 euro
    And The balance including interest of DK contract 2 is 1668.89 euro
    And The balance including interest of DK contract 6 is 0.00 euro