module ClientsHelper
  def display_all_clients
    tag.ul do
      @clients.each do |client|
        concat tag.li(link_to(client.username, photographer_path(client))) unless client == current_client
      end
    end
  end
end
