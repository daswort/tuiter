require 'spec_helper'

describe "Pagina usuarios" do

  subject { page }
  
  describe "Pagina perfil" do
    let(:usuario) { FactoryGirl.create(:usuario) }
    before { visit usuario_path(usuario) }

    it { should have_selector('h1',    text: usuario.nombre) }
    it { should have_selector('title', text: usuario.nombre) }
  end

  describe "pagina registro" do
    before { visit registro_path }

    it { should have_selector('h1',    text: 'Registrate') }
    it { should have_selector('title', text: full_title('Registro')) }
  end
  
  describe "registro" do

    before { visit registro_path }

    let(:submit) { "Crear mi cuenta" }

    describe "con informacion invalida" do
      it "no deberia crear usuario" do
        expect { click_button submit }.not_to change(Usuario, :count)
      end
    end

    describe "con informacion valida" do
      before do
        fill_in "Nombre",       with: "Ejemplo Usuario"
        fill_in "Email",        with: "usuario@ejemplo.com"
        fill_in "Contrasena",   with: "foobar"
        fill_in "Confirmacion", with: "foobar"
      end

      it "deberia crear usuario" do
        expect { click_button submit }.to change(Usuario, :count).by(1)
      end
    end
  end
end
