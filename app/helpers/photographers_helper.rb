module PhotographersHelper
  def display_all_photographers
    tag.ul do
      @photographers.each do |photographer|
        unless photographer == current_photographer
          concat tag.li(link_to(photographer.username, photographer_path(photographer)))
        end
      end
    end
  end
end
