class UrlsController < ApplicationController
  def create
    url = Url.build_url(url: original_url)

    if url.save
      return render json: { message: 'created', url: url.url }, status: 201
    end

    return render json: { errors: url.errors }, status: 422
  end

  def show
    url = Url.find_by(url: params[:url])

    if url
      url.update_columns(view_count: url.view_count += 1)

      return render json: { url: url.original_url }, status: 302
    else
      render json: { message: 'not found' }, status: 404
    end
  end

  def index
    urls = Url.all.order(query_params[:order] => query_params[:direction]).limit(100)

    render json: urls, status: 200
  end

  private

  def query_params
    params.permit(:order, :direction)
  end

  def url_params
    params.require(:url).permit(:original_url)
  end

  def original_url
    url_params[:original_url]
  end
end

