class UrlsController < ApplicationController
  def create
    url = Url.build_url(url: original_url)

    if url.save
      return render json: { message: 'created' }, status: 201
    end

    return render json: { errors: url.errors }, status: 422
  end

  def show
    url = Url.find_by(url: params[:url])

    if url
      return render json: { url: url.original_url }, status: 302
    else
      redirect_to '/'
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end

  def original_url
    url_params[:original_url]
  end
end

