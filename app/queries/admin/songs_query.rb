class Admin::SongsQuery
  attr_reader :params, :songs

  def initialize(params, songs = Song.all)
    @params = params
    @songs = songs
  end

  def call
    songs_list = @songs.includes(:artists)

    songs_list = by_title(songs_list) if @params[:title].present?
    
    songs_list

  end

  def by_title(list)
    list.where('title ILIKE ?', "%#{@params[:title]}%")
  end
end
