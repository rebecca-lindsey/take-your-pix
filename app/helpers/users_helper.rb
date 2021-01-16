module UsersHelper
  def display_user_albums
    tag.ul do
      @albums.each do |album|
          concat tag.li(link_to(album.title, album_path(album)))
        end
      end
    end
end
