Feature: Create my own campaign
  In order to mobilize people to my cause
  As a mobilizer
  I want to create my own campaign

  @omniauth_test
  Scenario: when I'm smart enough to successfully fill the new campaign form
    Given I'm logged in
    And I'm in the new campaign page
    And I fill "O que você quer mudar na sua cidade?" with "Evitar que desapareçam com a praça Nossa Senhora da Paz"
    And I fill "Porque essa campanha é importante?" with "A praça é um patrimônio histórico e existem outras soluções para o metro que tomará o seu lugar."
    When I press "Criar minha campanha"
    Then I should be in the campaigns page
    And I should see "Aí! Recebemos a sua campanha. Em breve entraremos em contato para colocá-la no ar..."