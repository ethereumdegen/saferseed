class Givenshare < ActiveRecord::Base

    

     def getId()
    return "#{id}"
     end

	def takenFromGroup()
        return getSendingUserId()==0
    end

	def getSendingUserId()
    return "#{sendinguserid}"
     end


    def getReceivingUserId()
    return "#{receivinguserid}"
     end    
    
    def getAmount()
    return "#{amount}"
     end    
    
end
