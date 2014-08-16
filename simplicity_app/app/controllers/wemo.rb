require 'sinatra'

helpers do
	def get_status
		@status = system("wemo switch 'WeMo Switch' status")
		if @status == '1' 
			p 'its on'
		elsif @status == '0' 
			p 'its off'
		end
		p @status
		p @status.class
	end
end


get '/' do
	erb :index
end

#Refactor:
#post '/:onOff' do
#	wemo(params[:command])
#
#	redirect '/'
#end

get '/on' do
	response.headers['Access-Control-Allow-Origin'] = "*"
	wemo('on')

	redirect '/'
end

get '/off' do
	response.headers['Access-Control-Allow-Origin'] = "*"
	wemo('off')

	redirect '/'
end

get '/status' do
	response.headers['Access-Control-Allow-Origin'] = "*"
	get_status
end

	
def wemo(onOff)
	system("wemo switch 'WeMo Switch' #{onOff}")
end

