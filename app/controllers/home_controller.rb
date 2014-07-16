class HomeController < ApplicationController

	include AuthenticationHelper


	 require 'amatch'
 	# => true
 	include Amatch
 	# => Object


  def index
  		@infosplash = true

      if(signed_in?)
      	@infosplash = false
      end


      @SHOWSIGNINBUTTON = false
      
  end

  def acceptmessage()
    
    message = Privatemessage.find(params[:messageid])      

      if(current_user.getId != message.getReceivingUserId)
        return false
      end

    if(message.getMessageType == "joingroup")
      if(group = Group.find_by_id(message.getText))
        group.addMember(message.getSendingUser);

        message.setAccepted()
      end
    end

      render :text => message.getText
  		return true
  end

    def rejectmessage()
    
    message = Privatemessage.find(params[:messageid])      

      if(current_user.getId != message.getReceivingUserId)
        return false
      end

    if(message.getMessageType == "joingroup")
      if(group = Group.find_by_id(message.getText))        
        message.setRejected()
      end
    end

      render :text => message.getText
      return true
  end

end
