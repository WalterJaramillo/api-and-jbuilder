json.data do
    json.user do
        json.id @user.id
        json.username @user.username
        json.video 'Esto es una prueba'
        json.sexo 'aqui va el sexo'
    end
end
