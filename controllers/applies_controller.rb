require 'sinatra/namespace'
require 'sinatra'
namespace '/api/v1' do

  get '/applies_read' do
    collection_to_api(Apply.read)
  end

  get '/applies_unread' do
    collection_to_api(Apply.unread)
  end

  get '/applies_invited' do
    collection_to_api(Apply.invited)
  end

  get '/applies_uninvited' do
    collection_to_api(Apply.uninvited)
  end

  post '/applies' do
    apply = Apply.create(params)
    apply.nil? ? [].to_json : company.values.to_json
  end

  get '/applies_by_job/:id' do
    job = Job.where(id: params[:id]).first
    halt(404, { message:'Job Document Not Found', status: 404, params_id: params[:id]}.to_json) unless job
    job_id = job.id
    puts "job id = #{job_id.inspect}"

    applies = Apply.where(job_id: job_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless applies
    collection_to_api(applies)
  end

  get '/apply_info/:id' do
    apply = Apply.where(id: params[:id]).first
    halt(404, { message:'Document Not Found', status: 404, params_id: params[:id]}.to_json) unless apply
    puts "apply id = #{apply.id.inspect} "
    puts "apply = #{apply.values.inspect} "
    apply.values.to_json	# serialization
  end

  get '/applies_by_geek/:name' do
    geek = Geek.where(name: params[:name]).first
    halt(404, { message:'Geek Document Not Found', status: 404, params_id: params[:id]}.to_json) unless geek
    geek_id = geek.id
    puts "geek id = #{geek_id.inspect}"

    applies = Apply.where(geek_id: geek_id)
    halt(404, { message:'Documents Not Found', status: 404, params_id: params[:id]}.to_json) unless applies
    collection_to_api(applies)
  end
end

