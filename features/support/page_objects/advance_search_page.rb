class AdvanceSearchPage < SitePrism::Page
  set_url "/advanced_search/client"

  element :client_name, "#name"
  element :reference_number, "#reference_number"
  element :dob_day, "#_date_of_birth_day"
  element :dob_month, "#_date_of_birth_month"
  element :dob_year, "#_date_of_birth_year"
  element :post_code, "#postcode"
  element :submit, "input[type='submit']"

  section :search_result, "div.card table.table" do
    sections :serach_result_row, "tbody tr" do
      element :client_name, "td:nth-child(1) a"
      element :postcode, "td:nth-child(2)"
      element :dob, "td:nth-child(3)"
      element :location, "td:nth-child(4)"
      element :ref_id, "td:nth-child(5)"
      element :merge, "button", text: "Select to merge"
    end
  end


  def search_for_client(name = '', ref_number ='', day = '', month = '', year = '', postcode = '')
    client_name.set(name)
    reference_number.set(ref_number)
    dob_day.set(day)
    dob_month.set(month)
    dob_year.set(year)
    post_code.set(postcode)
    submit.click
  end

  def find_client_in_search_result_using_name_and_ref_id(name, ref_id)
    wait_until{has_search_result?}
    search_result.serach_result_row.find{|result| result.client_name.text.include?(name) && result.ref_id.text.include?(ref_id)}
  end

end