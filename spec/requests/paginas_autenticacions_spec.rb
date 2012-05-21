require 'spec_helper'

describe "Autenticacion" do

  subject { page }

  describe "Pagina inicio sesion" do
    before { visit ingreso_path }

    it { should have_selector('h1',    text: 'Inicia Sesion') }
    it { should have_selector('title', text: 'Ingreso') }
  end
  
  describe "Ingreso" do
    before { visit ingreso_path }

    describe "con informacion invalida" do
      before { click_button "Ingresa" }

      it { should have_selector('title', text: 'Ingreso') }
      it { should have_selector('div.alert.alert-error', text: 'Invalido') }
	  
	  describe "despues de visitar otra pagina" do
        before { click_link "Inicio" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end
	
	describe "con informacion valida" do
      let(:usuario) { FactoryGirl.create(:usuario) }
      before do
        fill_in "Email",    with: usuario.email
        fill_in "Contrasena", with: usuario.password
        click_button "Ingresa"
      end

      it { should have_selector('title', text: usuario.nombre) }
      it { should have_link('Perfil', href: usuario_path(usuario)) }
      it { should have_link('Cerrar Sesion', href: salir_path) }
      it { should_not have_link('Iniciar Sesion', href: ingreso_path) }
    end
  end
end