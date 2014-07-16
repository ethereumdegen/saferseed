class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   include GoogleHelper

  BASEURL = 'http://saferseed.com:3002/'


before_filter :set_vars
def set_vars
  
   @SITENAME = 'SaferSeed'
   @SHOWSIGNINBUTTON = true

   greenSwatch = ["#CFF09E","#A8DBA8","#79BD9A","#3B8686","#0B486B"]
   sandSwatch = ["#F38630", "#E0E4CC","#69D2E7"]
   @CHARTCOLORS = greenSwatch
end
 

  protect_from_forgery with: :exception

  CLIENT_ID = '274228951819-7a4n9bi23pu22mjl6barnkmqcc9j6tfp.apps.googleusercontent.com'
  CLIENT_SECRET = 'kcA7vHjAZhmmHojn1lGpTm1j'
  CLIENT_SCOPE = 'https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email'

end
