module UsersHelper
  def display_user_albums
    tag.ul do
      @albums.each do |album|
        concat tag.li(link_to(album.title, album_path(album)))
      end
    end
  end

  def display_form_errors
    tag.ul do
      @user.errors.full_messages.each do |message|
        concat tag.li(message) unless message.include?('digest')
      end
    end
  end
end
