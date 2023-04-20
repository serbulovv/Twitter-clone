class TweetsController < ApplicationController
  def create
    @operation = Tweets::CreateOperation.new.call(params, current_user)

    if @operation.success?
      respond_to do |format|
        format.html { redirect_to dashboard_path } 
        format.turbo_stream
      end
    else
      flash[:alert] = @operation.parse_errors 
    end
  end
end
