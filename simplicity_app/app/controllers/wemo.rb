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

get '/on' do
	wemo('on')

	redirect '/'
end

get '/off' do
	wemo('off')

	redirect '/'
end

get '/status' do
	get_status
end

	
def wemo(on_off)
	system("wemo switch 'WeMo Switch' #{on_off}")
end

