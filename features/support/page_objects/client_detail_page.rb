class ClientDetailPage < SitePrism::Page

  element :flash_message, ".flash-success .flash-message div.d-flex div:nth-child(1)"

  section :client_personal_detail, "#personal_details_view_body" do
    element :name, "div p.h4"
    element :postcode, "div p:nth-child(2)"
    element :dob, ".grouped div:nth-child(1) dd"
  end

  def get_client_ref_id()
    ref_id = flash_message.text.split(': ')[1]
  end

  def get_month_from_intFormat(mon)
    month = ''
    case mon
      when '1' || '01'
        month = 'Jan'
      when '2'|| '02'
        month = 'Feb'
      when '3' || '03'
        month = 'Mar'
      when '4' || '04'
        month = 'Apr'
      when '5' || '05'
        month = 'May'
      when '6' || '06'
        month = 'Jun'
      when '7' || '07'
        month = 'Jul'
      when '8' || '08'
        month = 'Aug'
      when '9' ||'09'
        month = 'Sep'
      when '10'
        month = 'Oct'
      when '11'
        month = 'Nov'
      when '12'
        month = 'Dec'
    end
    month
  end

end