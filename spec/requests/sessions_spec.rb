require 'rails_helper'

RSpec.describe "Login", type: :request do
  let!(:admin) { User.create!(name: "Admin", email: "admin@unb.br", password: "123456", role: "admin") }

  it "permite login com credenciais válidas" do
    post "/login", params: { email: "admin@unb.br", password: "123456" }
    expect(response).to redirect_to(admin_dashboard_path)
  end

  it "rejeita login com senha incorreta" do
    post "/login", params: { email: "admin@unb.br", password: "errada" }
    expect(response.body).to include("E-mail ou senha inválidos")
  end
end
