*** Settings ***
Library     String
Resource    ../keywords/login.resource
Resource    ../object_repo/login_obj.resource
Resource    ../object_repo/installed_operators_obj.resource


*** Keywords ***
User Navigates To ${subMenuOption} Under ${sideNavBarMenu}
    User Expands ${sideNavBarMenu}
    User Selects ${subMenuOption} On ${sideNavBarMenu}

User Expands ${sideNavBarMenu}
    ${btnNavMenuUpd}=    Replace String    ${btnNavMenu}    <<menu>>    ${sideNavBarMenu}
    Element Should Be Visible    ${btnNavMenuUpd}
    ${expanded}=    Get Element Attribute    ${btnNavMenuUpd}    aria-expanded
    Run Keyword If    '${expanded}'=='false'
    ...    Click Element    ${btnNavMenuUpd}

User Selects ${subMenuOption} On ${sideNavBarMenu}
    ${elemNavChildMenuUpd}=    Replace String    ${elemNavChildMenu}    <<menu>>    ${sideNavBarMenu}
    ${elemNavChildMenuUpd}=    Replace String    ${elemNavChildMenuUpd}    <<submenu>>    ${subMenuOption}
    Wait Until Element Is Visible    ${elemNavChildMenuUpd}    timeout=3s
    Click Element    ${elemNavChildMenuUpd}
    ${lblChildPageHeader}=    Replace String    ${lblChildPageHeader}    <<submenu>>    ${subMenuOption}
    Wait Until Page Contains Element    ${lblChildPageHeader}    timeout=30s

The Browser Is On ${pageHeader} Page
    ${lblPageTitle}=    Replace String    ${lblPageTitle}    <<header>>    ${pageHeader}
    Element Should Be Visible    ${lblPageTitle}

User Navigates To Database Access Page
    Element Should Be Visible    ${elemDataServiceNav}
    Click Element    ${elemDataServiceNav}
    Element Should Be Visible    ${elemDataAccessNav}
    Click Element    ${elemDataAccessNav}

User Navigates To DBaaS Inventories Screen
    [Arguments]    ${PROJECT}=redhat-dbaas-operator
    User Navigates To Installed Operators Under Operators
    User Filters ${PROJECT} Namespace On Project Dropdown
    Wait Until Page Contains Element    ${elemDbaasStatus}    timeout=15s
    Page Should Contain Element    ${lnkProvAcc}
    Click Element    ${lnkProvAcc}
    Wait Until Page Contains Element    ${titleDbaasInventories}    timeout=10s
