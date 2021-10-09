json.data do
    json.user do
        json.id @user.id
        json.username @user.username
        json.video 'Esto es una prueba'
    end
end
