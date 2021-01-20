module PhotographersHelper
  # def display_all_photographers
  #   tag.ul do
  #     @photographers.each do |photographer|
  #       unless photographer == current_photographer
  #         concat tag.li(link_to(photographer.username, photographer_path(photographer)))
  #       end
  #     end
  #   end
  # end
  def display_all(model)
    array = model.constantize.all
    tag.ul do
      array.each do |element|
        unless element.id == session[:user_id]
          concat tag.li(link_to(element.attributes.values[1], send("#{model.downcase}_path", element)))
        end
      end
    end
  end
end

# Add send method
