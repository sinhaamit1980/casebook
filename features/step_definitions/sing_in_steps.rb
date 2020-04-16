
Given(/^I sign in to casebook$/) do
  sign_in_page.sign_in_to_casebook('qa_casebook_supervisor@citizensadvice.org.uk', '96=TP3[f(~*@mML[')
  sleep(5)
  Timeout.timeout(120){home_page.home_link.visible?}
end
