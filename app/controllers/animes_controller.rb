class AnimesController < ApplicationController
  def index
    @pagy, @animes = pagy(
      Animes::Query.fetch(scope: Anime, params: params),
      items: 12
    )
  end

  def show
    anime
  end

  def new
    @anime = Anime.new
  end

  def edit
    anime
  end

  def update
    anime
    poster = params[:anime][:poster]
    if !poster.nil? &&
      (poster.size < Anime::MAX_SIZE_OF_POSTER) &&
      (poster.headers.match?(/(Content-Type: image\/(jpeg|png))/)) &&
      (@anime.update(anime_params))
      if @anime.poster_upload(@anime.poster)
        redirect_to @anime
      end
    elsif poster.nil? &&
      (@anime.update(anime_params))
      redirect_to @anime
    else
      render 'animes/edit'
    end
  end

  def arcs
    anime
  end

  def create
    @anime = Anime.new(anime_params)
    poster = params[:anime][:poster]
    if !poster.nil? &&
      (poster.size < Anime::MAX_SIZE_OF_POSTER) &&
      (poster.headers.match?(/(Content-Type: image\/(jpeg|png))/)) && @anime.save
      if @anime.poster_upload(@anime.poster)
        arc_create
      end
    elsif poster.nil?
      if @anime.save
        arc_create
      end
    else
      render 'animes/new'
    end
  end

  private
  def arc_create
    @arc = Arc.new(anime_id: @anime.id, canonical: "First Arc", russian: "Первая арка", episodes: "{0, 0}", number: 1)
    @arc.save
    redirect_to @anime
  end

  def anime
    @anime = Anime.find(params[:id])
  end

  def anime_params
    params.require(:anime).permit(
      :canonical,
      :russian,
      :optionally,
      :kind,
      :status,
      :episodes_number,
      :age_rating,
      :description_ru,
      :description_en,
      :duration,
      :score,
      :franchise,
      :poster
    )
  end
end
