get '/' do
	erb :index
end

get '/:username' do
	@user = User.find_or_create_by(username: params[:username])
	@recent_tweets = @user.tweets #recent_tweets
# 	if @user.tweets_stale?
# 		@user.tweets each {|tweet| tweet.destroy}
# 		@recent_tweets = @user.recent_tweets
# 		erb :user_tweets
# end
	@recent_tweets = @user.tweets
	erb :user_tweets

end

post '/tweet/search' do
	@user = params[:username]
	redirect to "/#{@user}"
end
