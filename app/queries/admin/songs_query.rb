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
    list.where(
      "REPLACE(LOWER(title), ' ', '') LIKE ?",
      "#{@params[:title].to_s.strip.downcase.gsub(' ', '')}%"
    )
  end
end
