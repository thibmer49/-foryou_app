class ApplicationController < ActionController::Base
  before_action :authenticate_user!
<<<<<<< HEAD
=======
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
>>>>>>> cd84af6e595ad62293afc0273b1cfa25c25e9455
end
