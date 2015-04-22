require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  def create
    @entry = current_user.microposts.build(entry_params)
    if @entry.save
      flash[:success] = "Entry created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  private

    def entry_params
      params.require(:micropost).permit(:content)
    end
end
