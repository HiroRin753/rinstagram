class UsersController < ApplicationController
  def show 
    @user = User.find_by(id:params[:id]) #find_byは与えられた条件にマッチするレコードのうち最初のレコードだけを返す

  end
end
