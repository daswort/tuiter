require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Tuiter') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Ayuda') }
    it { should have_title(full_title('Ayuda')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('Nosotros') }
    it { should have_title(full_title('Nosotros')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contacto') }
    it { should have_title(full_title('Contacto')) }
  end
end