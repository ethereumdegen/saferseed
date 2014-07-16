class UsersController < ApplicationController



include AuthenticationHelper


def createprivatemessage


user = User.find(params[:newmessage][:receivinguserid])


if(!current_user or current_user == user)
render :text => 'cannot send message to self'
return false
end


newprivatemessage = Privatemessage.create(sendinguserid: current_user.getId, receivinguserid: user.getId, messagetype: 'privatemessage', text: params[:newmessage][:text])


redirect_to user.getPageLink

end







end



