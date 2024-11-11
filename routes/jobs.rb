require 'sinatra/namespace'
require 'sinatra'
require 'sinatra/base'

namespace '/api/v1' do

  get '/jobs' do
    # if params[:company_id]
    #   jobs = Job.where(params[:company_id])
    # else
    jobs = Job.all
    # end

    [:place, :name].each do |filter|
      jobs = jobs.send(filter, params[filter]) if params[filter]
    end

    # Фильтрация по названию работы
    # if params[:name]
    #   jobs = jobs.send(name: params[:name])
    # end
    #
    # # Фильтрация по расположению
    # if params[:place]
    #   jobs = jobs.where(place: params[:place])
    # end

    collection_to_api(jobs)
  end
end
