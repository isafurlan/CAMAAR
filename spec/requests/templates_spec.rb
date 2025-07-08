require 'rails_helper'

RSpec.describe "Admin - Templates", type: :request do
  let!(:admin) { User.create!(name: "Admin", email: "admin@unb.br", password: "123456", role: "admin") }

  before do
    post "/login", params: { email: admin.email, password: "123456" }
  end

  it "permite o admin acessar a página de templates" do
    get "/admin/templates"
    expect(response).to have_http_status(:ok)
  end

  it "impede usuário comum de acessar templates" do
    delete "/logout"
    student = User.create!(name: "Aluno", email: "aluno@unb.br", password: "123456", role: "student")
    post "/login", params: { email: student.email, password: "123456" }

    get "/admin/templates"
    expect(response).to redirect_to(root_path)
  end
end
