require_relative 'config/environment'

use Rack::MethodOverride
use BusinessesController
use UsersController
use RestaurantsController
run ApplicationController
