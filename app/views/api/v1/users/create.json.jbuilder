#json.id @user.id
#json.nombre @user.nombre
#json.token @user.token


json.status 'success'
json.user do
    json.id @user.id
    json.nombre @user.nombre
    json.token @user.token
end
