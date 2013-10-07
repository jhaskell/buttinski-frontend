<?php

namespace GBS\Behat\Context;

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;
use Behat\Mink\Driver\GoutteDriver;
use Behat\Mink\Driver\Goutte\Client as GoutteClient;
use Behat\Mink\Session;
use Guzzle\Http\Client as GuzzleClient;

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    /**
     * @When /^I fill in (\d+) characters of nonsense for "([^"]*)"$/
     */
    public function iFillInCharactersOfNonsenseFor($count, $field)
    {
        $field = $this->fixStepArgument($field);
        $count = $this->fixStepArgument($count);
        $this->getSession()->getPage()->fillField($field, str_repeat('a', $count));
    
    }

    /**
     * @Given /^I have logged in with username "([^"]*)" and password "([^"]*)"$/
     */
    public function iHaveLoggedInWithUsernameAndPassword($username, $password)
    {
        $page = $this->getSession()->getPage();

        $page->fillField('Username', $username);
        $page->fillField('Password', $username);
        $page->pressButton('Login');
    }
}
