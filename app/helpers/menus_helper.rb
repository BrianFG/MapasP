module MenusHelper



	def checkboxes(lista, names) 
		lista.map.with_index do  |x, i|
		 fancy_checkbox("c#{i}", "#{names}[]", x.id, x.nombre, "success" )
		end.join()

	end

	def fancy_checkbox(id,name,value,label,clase)
		"<div class='checkbox checkbox-#{clase}'><input type='checkbox' id='#{id}' name='#{name}' value='#{value}'/><label for='#{id}' class='css-label'>#{label}</label></div>"
	end

	def forma(lista ,action, names)
		"<form action='#{action}' method='get'>" +
		checkboxes(lista, names)+
		submit_tag("Filtrar", class: "btn btn-success").to_s+
		"</form>"
	end

	def hidden_value(name, value)
		"<input type='hidden' name='#{name}[]' value='#{value}'>"
	end

	def hidden_values(lista, names)
		lista.map do |x|
			hidden_value(names,x)
		end.join()
	end


end
