module AlbumsHelper
  def display_all_photos
    tag.ul do
      @photos.each do |photo|
        concat tag.li(link_to(photo.title, album_photo_path(@album, photo)))
      end
    end
  end
end
