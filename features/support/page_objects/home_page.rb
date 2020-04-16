class HomePage < SitePrism::Page

  set_url "https://casebook.qa.citizensadvice.org.uk/"

  element :home_link, 'a.header__navLink', text: 'Home'
  element :header_find_client, 'a[href="/advanced_search/client"]', text: 'Find client'
  element :add_new_client, 'a[href="/clients/new"]', text: 'Add new client'
  element :find_a_client, "#find_client_dashboard"
  element :user_menu, "#user_menu_button"
  element :sing_out, "button", text: 'Sign out'


  section :auto_client_list, "#find_client_dashboard_listbox" do
    sections :row, "tbody tr" do
      element :reference_number, "td:nth-child(1)"
      element :name, "td:nth-child(2)"
      element :postcode, "td:nth-child(3)"
      element :location, "td:nth-child(4)"
    end
  end


  def select_a_client(name, ref_number)
    wait_until{has_find_a_client?}
    find_a_client.set(name)
    client_row = find_a_client_using_name_and_reference_number(name, ref_number)
    client_row.name.click
  end

  def find_a_client_using_name_and_reference_number(name, ref_number)
    wait_until{auto_client_list.row.count > 0}
    auto_client_list.row.find {|client_row| client_row.name.text.include?(name) && client_row.reference_number.text.include?(ref_number)}
  end

  def sign_out_the_user
    user_menu.click
    sing_out.click
  end  

end