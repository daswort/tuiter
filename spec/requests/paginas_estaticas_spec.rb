require 'spec_helper'

describe "Paginas estaticas" do

  describe "Pagina inicio" do

    it "debe tener un h1 que diga 'Tuiter'" do
      visit '/paginas_estaticas/inicio'
      page.should have_selector('h1', :text => 'Tuiter')
    end

    it "debe tener un title que diga 'Inicio'" do
      visit '/paginas_estaticas/inicio'
      page.should have_selector('title', :text => "Tuiter | Inicio")
    end
	
	it "no debe tener un titulo de pagina costumizado" do
      visit '/paginas_estaticas/inicio'
      page.should_not have_selector('title', :text => '| Inicio')
    end
  end

  describe "Pagina Ayuda" do

    it "debe tener un h1 que diga 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_selector('h1', :text => 'Ayuda')
    end

    it "debe tener un title que diga 'Ayuda'" do
      visit '/paginas_estaticas/ayuda'
      page.should have_selector('title', :text => "Tuiter | Ayuda")
    end
	
	it "no debe tener un titulo de pagina costumizado" do
      visit '/paginas_estaticas/ayuda'
      page.should_not have_selector('title', :text => '| Ayuda')
    end
  end

  describe "Pagina Nosotros" do

    it "debe tener un h1 que diga 'Nosotros'" do
      visit '/paginas_estaticas/nosotros'
      page.should have_selector('h1', :text => 'Nosotros')
    end

    it "debe tener un title que diga 'Nosotros'" do
      visit '/paginas_estaticas/nosotros'
      page.should have_selector('title', :text => "Tuiter | Nosotros")
    end
	
	it "no debe tener un titulo de pagina costumizado" do
      visit '/paginas_estaticas/nosotros'
      page.should_not have_selector('title', :text => '| Nosotros')
    end
  end
end
