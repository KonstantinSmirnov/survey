class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    if current_user
      I18n.locale = current_user.locale.to_sym || I18n.default_locale
    else
      I18n.locale = extract_locale_from_accept_language_header
    end
  end

  private
  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
