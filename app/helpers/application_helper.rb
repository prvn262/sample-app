module ApplicationHelper
	def full_title(page_title = "")
		base_title = "Ruby on Rails Sample App"
		if page_title.empty?
			base_title
		else
			"#{page_title} | #{base_title}"
		end
	end

	def error_klass(key)
		case key.to_sym
    when :notice  then "alert alert-info"
    when :alert   then "alert alert-danger"
    when :success then "alert alert-success"
    when :danger  then "alert alert-danger"
    when :info  then "alert alert-info"
    else "alert alert-secondary"
    end
  end
end

