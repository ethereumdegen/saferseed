class User < ActiveRecord::Base

       require 'action_view'
    include ActionView::Helpers::DateHelper


    include ApplicationHelper

     def getId()
    return "#{id}"
     end

		def getFirstName()
    return "#{first_name}"
     end

	 def getFullName()
    return "#{first_name} #{last_name}"
     end

    def getLastName()
    return "#{last_name}"
     end

     def getEmail()
    return "#{email}"
     end

	def getUserId()
    return "#{uid}"
     end

     def getPageLink
        return site_url.clone().concat('users/').concat(getId)
     end


       def createdRecently()
    return (Time.now - created_at) < 100000
        end

     def getOwnershipOfGroup(grp)
    ownership = 0.0

    Givenshare.all.each do |share|
      if(!share.takenFromGroup)
        if(share.getSendingUserId == getUserId)
        ownership = ownership - share.getAmount
        end
        if(share.getReceivingUserId == getUserId)
        ownership = ownership + share.getAmount
        end
      end
    end

    return ownership
  end



  def returnShareToGroup(grp,amt)
    if(getOwnershipOfGroup(grp) < amt)
        return false
    end


    amt = -(amt.abs)    
    newshare = Givenshare.create(userid: getId, groupid: grp.getId, amount: amt)
    return true
  end
    
     def getTimeSince()
        return time_ago_in_words(created_at)
     end

end
