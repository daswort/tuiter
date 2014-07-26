require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Tuiter'" do
      visit '/static_pages/home'
      expect(page).to have_content('Tuiter')
    end

    it "should have the title 'Inicio'" do
      visit '/static_pages/home'
      expect(page).to have_title("Tuiter")
    end
  end

  describe "Help page" do

    it "should have the content 'Ayuda'" do
      visit '/static_pages/help'
      expect(page).to have_content('Ayuda')
    end

    it "should have the title 'Ayuda'" do
      visit '/static_pages/help'
      expect(page).to have_title("Tuiter | Ayuda")
    end
  end

  describe "About page" do

    it "should have the content 'Nosotros'" do
      visit '/static_pages/about'
      expect(page).to have_content('Nosotros')
    end

    it "should have the title 'Nosotros'" do
      visit '/static_pages/about'
      expect(page).to have_title("Tuiter | Nosotros")
    end
  end
end