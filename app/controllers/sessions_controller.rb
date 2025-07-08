class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      case user.role
      when 'admin'
        redirect_to admin_dashboard_path, notice: 'Bem-vindo, administrador!'
      when 'student'
        redirect_to questionnaires_path, notice: 'Bem-vindo, aluno!'
      else
        redirect_to root_path, notice: 'Login realizado.'
      end

    else
      flash[:alert] = 'E-mail ou senha inválidos.'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logout realizado.'
  end
end
