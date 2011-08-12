class SimpleCaptchaController < ActionController::Base
  include SimpleCaptcha::ImageHelpers

  def show
    begin
      render :nothing => true, :status => 404 if params[:id].blank?
      send_data(
        File.read(generate_simple_captcha_image(params[:id])),
        :type => 'image/jpeg',
        :disposition => 'inline',
        :filename => 'simple_captcha.jpg'
      )
    rescue StandardError => e
      render :nothing => true, :status => 404
    end
  end
end
