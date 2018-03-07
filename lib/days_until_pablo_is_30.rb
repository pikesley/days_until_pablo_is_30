require 'sinatra/base'
require 'tilt/erubis'
require 'json'
require 'yaml'

require_relative 'days_until_pablo_is_30/helpers'
require_relative 'days_until_pablo_is_30/racks'

module DaysUntilPabloIs30
  class App < Sinatra::Base
    helpers do
      include DaysUntilPabloIs30::Helpers
    end

    get '/' do
      headers 'Vary' => 'Accept'

      end_date = CONFIG['birthday'].to_s
      end_date = params[:date] if params[:date]
      @days = days end_date

      @event = 'Pablo is 30'
      @event = params[:event] if params[:event]
      respond_to do |wants|
        wants.html do
          erb :index
        end

        wants.json do
          {
            event: @event,
            days: @days
          }.to_json
        end
      end
    end

    # start the server if ruby file executed directly
    run! if app_file == $0

    not_found do
      status 404
      @title = '404'
      erb :oops
    end
  end
end
