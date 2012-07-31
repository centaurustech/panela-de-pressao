#coding: utf-8

class PokeMailer < ActionMailer::Base
  default from: "from@example.com"

  def poke(the_poke)
    @poke = the_poke
    mail(
      :to => the_poke.campaign.targets.map{|t| "\"#{t.influencer.name}\" <#{t.influencer.email}>"}.join(", "), 
      :subject => the_poke.campaign.name,
      :from => "\"#{the_poke.user.name}\" <#{the_poke.user.email}>"
    )
  end

  def thanks(the_poke)
    @poke = the_poke
    mail(
      :to => @poke.user.email,
      :subject => "Valeu por apoiar a campanha: #{@poke.campaign.name}",
      :from => "contato@paneladepressao.org.br"
    )
  end
end
