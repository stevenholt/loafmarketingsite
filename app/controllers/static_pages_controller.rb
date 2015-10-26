class StaticPagesController < ApplicationController
  require 'json'

  def home
  end

  def homev2
  	

  	baseref = Bigbertha::Ref.new( 'https://loaf.firebaseio.com/chat' )
  	@roommessages = baseref.read
  	messageref = baseref.child( %w(room-messages -K0kvc-phL-i3mqzwG_D -K0kvmiA_6iaBaxVwkhp message) )
  	@amessagetext = baseref.child( %w(room-messages -K0kvc-phL-i3mqzwG_D -K0kvmiA_6iaBaxVwkhp message) ).read

  	@messages = baseref.child( %w(room-messages -K0kvc-phL-i3mqzwG_D )).val

  	@allmessages = []

  	@messagers = baseref.child( %w(room-messages -K0kvc-phL-i3mqzwG_D )).read.each do |msgaddress|
  		#baseref.child( %w(room-messages -K0kvc-phL-i3mqzwG_D )).child( msgaddress ).child( %w( name ) ).read do |msgvalue|
	  			@allmessages << baseref.child( %w(room-messages -K0kvc-phL-i3mqzwG_D )).child( msgaddress ).child( %w( message ) ).read
	  		#	puts msgvalue
	  	#end
  	end
  end
end
