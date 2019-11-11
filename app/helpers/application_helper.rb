module ApplicationHelper
  def uk_active_url?(test_path)
    return 'uk-active' if request.path == test_path
    ''
  end

  def uk_active_selected_account?(current_account, test_account)
    return 'uk-active' if (current_account == test_account) && ((request.path_parameters[:controller] == "accounts") && (request.path_parameters[:action] == "show") or (request.path_parameters[:controller] == "entries"))
    ''
  end

  def formatValue(value = Float.new)
	   if !value.nil?
 	  	 currency = '&euro;'
	 	   if value > 0
	  	   value = "<span class='positive_value'>+"+value.round(2).to_s+' '+currency+"</span>"
	  	 else
   	     	   value = "<span class='negative_value'>"+value.round(2).to_s+' '+currency+"</span>"
 	  	 end
     else
	     value="no value"
	   end
 	   return(value.html_safe)
	end
end
