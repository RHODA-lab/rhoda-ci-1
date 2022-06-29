*** Settings ***
Documentation       Test suite used with generic test cases
Metadata            Version    0.0.1

Library             SeleniumLibrary
Resource            ../resources/keywords/deploy_application.resource

Suite Setup         Set Library Search Order    SeleniumLibrary
Suite Teardown      Tear Down The Test Suite
Test Setup          Given The Browser Is On Openshift Home Screen
Test Teardown       Close Browser


*** Test Cases ***
Scenario: Verify error message for duplicate provider account friendly name
    [Tags]    smoke   RHOD-84-1
    When User Imports Valid CockroachDB Provider Account
    And User Navigates To Import Database Provider Account Screen From Database Access Page
    And User Enters Data To Import Duplicate CockroachDB Provider Account
    Then An Error Message Appears For An Existing Provider Account Name
