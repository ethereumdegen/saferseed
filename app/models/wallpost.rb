class Wallpost < ActiveRecord::Base

   require 'action_view'
    include ActionView::Helpers::DateHelper

     def getId()
    return "#{id}"
     end

	def getText()
    return "#{text}"
     end

     def getPostType()
    return "#{posttype}"
     end

     def getUser()
    	return User.find(getUserId)
     end

     def getUserId()
     	return "#{userid}"
     end
    
     def getGroup()
    	return Group.find(getGroupId)
     end

     def getGroupId()
     	return "#{groupid}"
     end

     def getTimeSince()
     	return time_ago_in_words(created_at).concat(" ago.")
     end
end
