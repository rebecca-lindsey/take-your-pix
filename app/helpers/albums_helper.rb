module AlbumsHelper
  def display_all_photos
    tag.ul do
      @photos.each do |photo|
        concat tag.li(link_to(photo.title, album_photo_path(@album, photo)))
      end
    end
  end

  def display_all_albums
    tag.ul do
      @albums.each do |album|
        concat tag.li(link_to(album.title, album_path(album)))
      end
    end
  end
end
