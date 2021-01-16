module AlbumsHelper
  def display_all_photos
    tag.ul do
      @photos.each do |photo|
        concat tag.li(link_to(photo.title, photo_path(photo)))
      end
    end
  end
end
