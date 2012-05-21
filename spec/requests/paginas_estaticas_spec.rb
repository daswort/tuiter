require 'spec_helper'

describe "Paginas Estaticas" do

  subject { page }

  describe "Pagina inicio" do
    before { visit root_path }

    it { should have_selector('h1', 	   text: 'Tuiter') }
    it { should have_selector('title', 	   text: full_title('')) }
    it { should_not have_selector 'title', text: '| Inicio' }
  end

  describe "Pagina ayuda" do
    before { visit ayuda_path }

    it { should have_selector('h1',    text: 'Ayuda') }
    it { should have_selector('title', text: full_title('Ayuda')) }
  end

  describe "Pagina nosotros" do
    before { visit nosotros_path }

    it { should have_selector('h1',    text: 'Nosotros') }
    it { should have_selector('title', text: full_title('Nosotros')) }
  end

  describe "Pagina contacto" do
    before { visit contacto_path }

    it { should have_selector('h1',    text: 'Contacto') }
    it { should have_selector('title', text: full_title('Contacto')) }
  end
end