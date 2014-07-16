class Privatemessage < ActiveRecord::Base

   require 'action_view'
    include ActionView::Helpers::DateHelper


     def getId()
    return "#{id}"
     end

  	def getSendingUserId()
     	return "#{sendinguserid}"
     end

   def getSendingUser()
    	return User.find_by_id(getSendingUserId)
     end

     def getReceivingUserId()
     	return "#{receivinguserid}"
     end

   def getReceivingUser()
    	return User.find_by_id(getReceivingUserId)
     end

	def getText()
    return "#{text}"
     end

     def getMessageType()
    return "#{messagetype}"
     end


      def getTimeSince()
     	return time_ago_in_words(created_at).concat(" ago.")
     end


     def setAccepted()
        
    end

    def setRejected()
        
    end

end