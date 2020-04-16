class AddClientPage < SitePrism::Page
  set_url '/clients/new'

  element :office_location, "#client_location_id"
  element :channel_in_person, '#client_contact_type_in_person'
  element :channel_other, "#client_contact_type_other"
  element :client_full_consent, "#client_full_consent_yes"
  element :client_consent_unnamed, "#client_full_consent_anonymous"
  element :client_ethnicity, "#client_consent_to_ethnicity"
  element :client_consent_to_followup, "#client_consent_to_follow_up"
  element :continue_btn, "button[name='showForm']"

  element :client_firstname, "#client_first_name"
  element :client_lastname, "#client_last_name"
  element :client_dob_date, "#client_date_of_birth_day"
  element :client_dob_month, "#client_date_of_birth_month"
  element :client_dob_year, "#client_date_of_birth_year"
  element :client_postcode_search, "#client_postcode_search"
  element :find_address_btn, "button.btn-primary", text: "Find address"

  element :select_address, :xpath, '//select[starts-with(@id,"cab-input-id-")]'
  element :add_address_manually, "button", text: 'Or enter address manually'
  element :client_postcode, "#client_postcode"

  element :select_gender, "#client_gender"
  element :select_ethnicity, "#client_ethnicity_id"
  element :client_email, "#client_email"


  element :disabled_health_problem, "#client_health_problem_none"
  element :disabled_not_to_say, "#client_health_problem_prefer_not_to_say"

  element :save_btn, ".btn-success", text: 'Save'

  def add_new_client(client_detail)
    wait_until{has_client_full_consent?}
    client_full_consent.click
    wait_until{has_continue_btn?}
    client_ethnicity.click
    continue_btn.click
    wait_until{has_client_firstname?}
    client_firstname.set(client_detail[:first_name])
    client_lastname.set(client_detail[:last_name])
    client_dob_date.set(client_detail[:day])
    client_dob_month.set(client_detail[:month])
    client_dob_year.set(client_detail[:year])
    client_postcode_search.set(client_detail[:post_code])
    find_address_btn.click
    wait_until{has_select_address?}
    add_address_manually.click
    wait_until{has_client_postcode?}
    client_postcode.set(client_detail[:post_code])
    select_gender.select(client_detail[:gender])
    select_ethnicity.select(client_detail[:ethnicity])
    client_email.set(client_detail[:email])
    case client_detail[:disability]
      when 'none'
        disabled_health_problem.click
      when 'prefer not to say'
        disabled_not_to_say.click
    end

    save_btn.click
  end

  def add_new_client_by_selecting_address(client_detail)
    wait_until{has_client_full_consent?}
    client_full_consent.click
    wait_until{has_continue_btn?}
    client_ethnicity.click
    continue_btn.click
    wait_until{has_client_firstname?}
    client_firstname.set(client_detail[:first_name])
    client_lastname.set(client_detail[:last_name])
    client_dob_date.set(client_detail[:day])
    client_dob_month.set(client_detail[:month])
    client_dob_year.set(client_detail[:year])
    client_postcode_search.set(client_detail[:post_code])
    find_address_btn.click
    wait_until{has_select_address?}
    select_address.set(client_detail[:address])
    select_address.select(client_detail[:address])
    select_gender.select(client_detail[:gender])
    select_ethnicity.select(client_detail[:ethnicity])
    client_email.set(client_detail[:email])
    case client_detail[:disability]
      when 'none'
        disabled_health_problem.click
      when 'prefer not to say'
        disabled_not_to_say.click
    end

    save_btn.click
  end

end