*** Settings ***
Library     SeleniumLibrary
Resource    common.robot

*** Variable ***
${login_btn}    dt_login_button
${email_field}  name=email
${password_field}   //*[@type="password"]
${login_oauth_btn}   //*[text()="Log in"]
${acc_info}     //*[@id="dt_core_account-info_acc-info"]
${demo_tab}     //*[@id="dt_core_account-switcher_demo-tab"]
${switch_virtual}   //*[@class="acc-switcher__id"]
*** Keyword ***


*** Test Cases ***
Open Deriv
    Login   ${my_email}     ${my_pw}
    SwitchVirtual
    BuyRiseContract
    BuyLowerContract
    RelativeBarrierError
    MultiplierContract