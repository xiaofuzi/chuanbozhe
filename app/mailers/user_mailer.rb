class UserMailer < ActionMailer::Base
  default from: "1292791363@qq.com"

  def welcome_email(user)
  	@user = user
  	@url  = "http://printing.herokuapp.com/signin"
  	mail(to: user.email,:subject => "欢迎来到传播者，这是一个分享专业印刷资讯的网站！")
  	
  end
end
