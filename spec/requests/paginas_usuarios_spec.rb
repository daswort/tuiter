require 'spec_helper'

describe "Pagina usuarios" do

  subject { page }

  describe "pagina registro" do
    before { visit registro_path }

    it { should have_selector('h1',    text: 'Registrate') }
    it { should have_selector('title', text: full_title('Registro')) }
  end
end
