class GroupsController < ApplicationController

 include AuthenticationHelper
 include ApplicationHelper

def new

end


#before_filter :init_group
#def init_group
#@newgroup = Group.new   
#end


def save

end

def joingroup()

  group = Group.find(params['groupid'])


  if(Privatemessage.where("sendinguserid = ? AND receivinguserid = ? AND messagetype = ? AND text = ?",current_user.getId,group.getUserIdOfOwner,'joingroup',group.getId).exists? )
    render :text => "Send request failed, a request is pending."
      return false
  end

  newmessage = Privatemessage.create(sendinguserid: current_user.getId, receivinguserid: group.getUserIdOfOwner, messagetype: 'joingroup', text: group.getId)
    
    render :text => "Sent request to join ".concat(group.getName)
   
    return true
  

 
end

def watchgroup()

  group = Group.find(params['groupid'])

  group.addWatcher(current_user)

  render :text => "You are watching ".concat(group.getName)

  return
end



def create

if params.include?(:newgroup)
    createnewcompany
end

end


def createnewcompany
	#add this company to the database 




  params[:newgroup][:uid] = current_user.getId   #put the Id of the creator (user) into the group record to make a link



  newgroup = Group.new( newgroup_params )




  @ableToSave = true
  count = 0
  @errormessage = ""

  Group.all.each do |group| 
   if(group.getUserIdOfOwner ==  current_user.getUserId) 
  	 count = count + 1
  end

  if(group.getName.downcase.delete(' ') == params[:newgroup][:name].downcase.delete(' '))
  	@ableToSave = false 
	@errormessage = "A group with that name already exists."
   end

     if(group.getEmail.downcase == params[:newgroup][:email].downcase)
  	@ableToSave = false 
	@errormessage = "A group with that email already exists."
   end
end


	if(count >= 5)
		@ableToSave = false 
		@errormessage = "Cannot register more than 5 groups at once! Please delete one first."
	end


   #before adding to database, I need to make sure companies of this name do not already exist,
   #also need to make sure that the user has only registered a max of 5 different companies! do it right here
  if(@ableToSave)
  		newgroup.save  #add to the database 
      newgroup.addMember(current_user)
      redirect_to site_url.clone.concat("groups/".concat(newgroup.getName.delete(' ')))

    else 


    puts @errormessage


  end
#redirect_to newgroup



end




def show
  @newgroup = Group.find(params[:id])
end


def createpost

group = Group.find(params[:newpost][:groupid])


if(!current_user or !group.hasMember(current_user))
return false
end


newwallpost = Wallpost.create(userid: current_user.getId, groupid: group.getId, posttype: 'message', text: params[:newpost][:text])

redirect_to site_url.clone.concat("groups/".concat( group.getName.delete(' ')  ))

end


private
  def newgroup_params

    params.require(:newgroup).permit(:name, :location,:webaddress,:imageurl, :email, :uid)
  end


end
