class Group < ActiveRecord::Base

  include ApplicationHelper

   def getId()
    return "#{id}"
  end

 def getName()
    return "#{name}"
  end

  def getEmail()
    return "#{email}"
  end

  def getUserIdOfOwner()
    return "#{uid}"
  end

  def createdRecently()
    return (Time.now - created_at) < 100000
        end
  
 def getSelfOwnership()
    ownership = 100.0

    Givenshare.all.each do |share|
      if(share.takenFromGroup)
        ownership = ownership - share.getAmount
      end
    end

    return ownership
  end


  def hasMember(usr)

      Member.all.each do |member|
          if(member.getUserId == usr.getId and member.getGroupId == getId)
            return true
          end
      end

    return false
  end


  def addMember(usr)
    if(hasMember(usr))
      return false
    end


    newmember = Member.create(userid: usr.getId, groupid: getId)
    newwallpost = Wallpost.create(userid: usr.getId, groupid: getId, posttype: 'joinedgroup')

    return true
  end

  def removeMember(usr)
    if(!hasMember(usr))
      return false
    end

    Member.destroy_all(:userid => usr.getId)
    newwallpost = Wallpost.create(userid: usr.getId, groupid: getId, posttype: 'leftgroup')

    return true
  end


  def hasWatcher(usr)
     Watcher.all.each do |watcher|
          if(watcher.getUserId == usr.getId and watcher.getGroupId == getId)
            return true
          end
      end

    return false
  end


  def addWatcher(usr)
    if(hasWatcher(usr))
      return false
    end

    newwatcher = Watcher.create(userid: usr.getId, groupid: getId)
    newwallpost = Wallpost.create(userid: usr.getId, groupid: getId, posttype: 'watchinggroup')
    
    return true
  end

  def removeWatcher(usr)
     if(!hasWatcher(usr))
      return false
    end

    Watcher.destroy_all(:userid => usr.getId)

    return true
  end

   def giveShareToUser(usr,amt)
    if(getSelfOwnership() < amt)
      return false
    end


    amt = amt.abs
    newshare = Givenshare.create(userid: usr.getId, groupid: getId, amount: amt)
    newwallpost = Wallpost.create(userid: usr.getId, groupid: getId, text: amt, posttype: 'givenshare')
    return true
  end
    

  def getPageLink
        return site_url.clone.concat('groups/').concat(getName)
     end

end
