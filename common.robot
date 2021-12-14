*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Keyword ***
Login
    [arguments]     ${email}    ${pw}
     Open Browser    url=https://app.deriv.com   browser=chrome
     maximize browser window
#    Set window     1280    1028
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
	 wait until page contains element   ${login_btn}     60
	 Click Element   ${login_btn}
     wait until page contains element   ${email_field}      15
	 input text     ${email_field}      ${email}
	 input text     ${password_field}      ${pw}
	 Click Element   ${login_oauth_btn}

#   Task 1
SwitchVirtual
     wait until page does not contain element    dt_core_header_acc-info-preloader   60
     #wait until page contains element   ${acc_info}   60
	 click element  ${acc_info}
	 element should be enabled  //*[text()="Real" and contains(@class,"active")]
	 click element  ${demo_tab}
	 element should be enabled  //*[text()="Demo" and contains(@class,"active")]
	 click element  ${switch_virtual}

#   Task 2
BuyRiseContract
    reload page
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    wait until page contains element    //*[@class="cq-symbol-select-btn"]  60
    click element   //*[@class="cq-symbol-select-btn"]
    sleep   3
    click element   //*[text()="Volatility 10 (1s) Index" and contains(@class, "sc-mcd__item__name")]
    wait until page contains element    dt_purchase_call_button     60
    sleep   3
    click element   dt_purchase_call_button

#   Task 3
BuyLowerContract
    reload page
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    wait until page contains element    //*[@class="cq-symbol-select-btn"]  60
    click element   //*[@class="cq-symbol-select-btn"]
    sleep   3
    click element   //*[text()="Forex" and contains(@class, "sc-mcd__filter__item")]
    sleep   1
    click element   //*[text()="AUD/USD" and contains(@class, "sc-mcd__item__name")]
    sleep   1
    click element   //*[@id="dt_contract_dropdown"]/div
    sleep   1
    click element   //*[@id="dt_contract_high_low_item"]
    sleep   1
    press keys      //*[@class="dc-input__field"]    CTRL+ALL    DELETE
    input text      //*[@class="dc-input__field"]    2
    click element   //*[@id="dc_payout_toggle_item"]
    press keys      //*[@id="dt_amount_input"]      CTRL+ALL    DELETE
    input text      //*[@id="dt_amount_input"]      15.50
    sleep   3
    click element   //*[@class="btn-purchase btn-purchase--2"]

#   Task 4
RelativeBarrierError
    reload page
    wait until page contains element    //*[@id="dt_amount_input"]  60
    press keys      //*[@id="dt_amount_input"]      CTRL+ALL    DELETE
    input text      //*[@id="dt_amount_input"]      10
    sleep   5
    press keys      //*[@id="dt_barrier_1_input"]   CTRL+ALL    DELETE
    input text      //*[@id="dt_barrier_1_input"]   -0.1
    sleep   10

#   Task 5
MultiplierContract
    reload page
    wait until page does not contain element    //*[@class="chart-container__loader"]   60
    wait until page contains element    //*[@class="cq-symbol-select-btn"]  60
    click element      //*[@class="cq-symbol-select-btn"]
    sleep   3
    click element      //*[text()="Synthetic Indices" and contains(@class, "sc-mcd__filter__item")]
    sleep   3
    click element      //*[text()="Volatility 50 Index" and contains(@class, "sc-mcd__item__name")]
    wait until page contains element    //*[@id="dt_contract_dropdown"]/div  60
    click element      //*[@id="dt_contract_dropdown"]
    click element      //*[@id="dt_contract_multiplier_item"]
#   Parameter (a)
    element should contain      //*[@id="trade_container"]/div[4]/div/fieldset[2]/div[1]     Stake
    element should not contain  //*[@id="trade_container"]/div[4]/div/fieldset[2]/div[1]     Payout
#   Parameter (b)
