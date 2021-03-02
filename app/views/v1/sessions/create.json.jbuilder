json.data do

  json.user do
    json.call(
      @user,
      :id,
      :email,
      :first_name,
      
    )
  end
  json.token token
end
