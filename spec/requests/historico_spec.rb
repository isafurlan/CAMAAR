require 'rails_helper'

RSpec.describe "Histórico de respostas", type: :request do
  let!(:aluno) { User.create!(name: "Aluno", email: "aluno@unb.br", password: "123456", role: "student") }

  before do
    post "/login", params: { email: aluno.email, password: "123456" }
  end

  it "informa que o aluno ainda não respondeu nenhum formulário" do
    get "/historico"
    expect(response.body).to include("Você ainda não respondeu nenhum formulário")
  end
end
