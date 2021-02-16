json.data do

  json.user do
    json.call(
      @user,
      :email,
      :first_name,
      :authentication_token
    )
  end

end
