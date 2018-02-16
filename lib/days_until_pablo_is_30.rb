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

      days = (DateTime.parse('2018-07-26') - DateTime.now).to_i

      respond_to do |wants|
        wants.html do
          @days = days
          erb :index
        end

        wants.json do
          {
            days: days
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
