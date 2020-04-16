
When(/^I add new client with valid details$/) do
  name = (0...8).map {(65 + rand(26)).chr}.join
  @details_hash = {first_name: "Test-first-#{name}", last_name: "Test-last-#{name}", post_code: 'CM1 1TF', address: '10 Coval Avenue, Chelmsford, Essex, CM11TF', gender: 'Male', ethnicity: 'White - British', day: "10", month: "02", year: "1981", email: 'test@test.com', disability: 'none'}
  home_page.add_new_client.click
  add_client_page.add_new_client(@details_hash)
end

When(/^I add new client with valid details by selecting address$/) do
  name = (0...8).map {(65 + rand(26)).chr}.join
  @@details_hash = {first_name: "Test-first-#{name}", last_name: "Test-last-#{name}", post_code: 'CM1 1TF', address: '10 Coval Avenue, Chelmsford, Essex, CM1 1TF', gender: 'Male', ethnicity: 'White - British', day: "10", month: "02", year: "1981", email: 'test@test.com', disability: 'none'}
  home_page.add_new_client.click
  add_client_page.add_new_client_by_selecting_address(@@details_hash)
end

Then(/^I can see a success message$/) do
  expect(client_detail_page).to have_flash_message
  expect(client_detail_page.flash_message.text.include?('Successfully created new client')).to be_truthy, "Success Message not found"
  @ref_id = client_detail_page.get_client_ref_id
  @@ref_id = client_detail_page.get_client_ref_id
end

When(/^I search for a client added in previous test$/) do
  home_page.home_link.click
  home_page.select_a_client(@@details_hash[:first_name], @@ref_id)
end

And(/^I have created a new client$/) do
  step "I add new client with valid details"
  step "I can see a success message"
end

When(/^I search for the client$/) do
  home_page.home_link.click
  home_page.select_a_client(@details_hash[:first_name], @ref_id)
end

Then(/^I can see the client detail$/) do
  expect(client_detail_page.client_personal_detail.name.text.eql?("#{@details_hash[:first_name]} #{@details_hash[:last_name]}"))
  expect(client_detail_page.client_personal_detail.postcode.text.include?(@details_hash[:post_code]))
  mth = client_detail_page.get_month_from_intFormat(@details_hash[:month])
  expect(client_detail_page.client_personal_detail.dob.text.include?("#{@details_hash[:day]} #{mth} #{@details_hash[:year]}"))
end

Then(/^I can see the client detail from previous test$/) do
  expect(client_detail_page.client_personal_detail.name.text.eql?("#{@@details_hash[:first_name]} #{@@details_hash[:last_name]}"))
  expect(client_detail_page.client_personal_detail.postcode.text.include?(@@details_hash[:post_code]))
  mth = client_detail_page.get_month_from_intFormat(@@details_hash[:month])
  expect(client_detail_page.client_personal_detail.dob.text.include?("#{@@details_hash[:day]} #{mth} #{@@details_hash[:year]}"))
end

And(/^search for following client$/) do |table|
  home_page.header_find_client.click
  @name = table.rows_hash['client_name']
  @ref_id = table.rows_hash['ref_id']
  @post_code = table.rows_hash['post_code']
  advance_search_page.search_for_client(@name, @ref_id)
end

Then(/^I can see the client detail in the search result$/) do
  client_row = advance_search_page.find_client_in_search_result_using_name_and_ref_id(@name, @ref_id)
  expect(client_row.client_name.text.include?(@name))
  expect(client_row.ref_id.text.include?(@ref_id))
  expect(client_row.postcode.text.include?(@post_code))
end