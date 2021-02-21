json.data do

  json.user do
    json.call(
      @user,
      :email,
      :first_name,
      
    )
  end
  json.token token
end
