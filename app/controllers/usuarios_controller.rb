class UsuariosController < ApplicationController
    def create
        @usuario = Usuario.new(usuario_params)
        @usuario.save
    end
    private
        def usuario_params
        params.require(:usuario).permit(:email, :login, :senha, :foto, :telefone)
    end
    def new 
    end
end
