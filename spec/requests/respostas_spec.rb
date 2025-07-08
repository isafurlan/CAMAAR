require 'rails_helper'

RSpec.describe "Resposta de formulário", type: :request do
  let!(:aluno) { User.create!(name: "Aluno", email: "aluno@unb.br", password: "123456", role: "student") }
  let!(:questionario) { Questionnaire.create!(title: "Engenharia de Software", active: true) }

  before do
    post "/login", params: { email: aluno.email, password: "123456" }
  end

  it "permite responder um formulário disponível" do
    get "/questionnaires/#{questionario.id}"
    expect(response.body).to include("Engenharia de Software")
  end

  it "não mostra formulário quando não há nenhum disponível" do
    questionario.update(active: false)
    get "/questionnaires"
    expect(response.body).to include("Nenhum formulário disponível no momento")
  end
end
