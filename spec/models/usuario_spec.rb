# == Schema Information
#
# Table name: usuarios
#
#  id              :integer         not null, primary key
#  nombre          :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

require 'spec_helper'

describe Usuario do

  before do
    @usuario = Usuario.new(nombre: "Ejemplo Usuario", email: "usuario@ejemplo.com", password: "foobar", password_confirmation: "foobar")
  end

  subject { @usuario }

  it { should respond_to(:nombre) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }
  
  describe "cuando el nombre este vacio" do
    before { @usuario.nombre = " " }
    it { should_not be_valid }
  end
  
  describe "cuando el nombre sea demasiado largo" do
    before { @usuario.nombre = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "cuando el email este vacio" do
    before { @usuario.email = " " }
    it { should_not be_valid }
  end
  
  describe "cuando el formato del email sea invalido" do
    it "debe ser invalido" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @usuario.email = invalid_address
        @usuario.should_not be_valid
      end      
    end
  end

  describe "cuando el formato del email sea valido" do
    it "debe ser valido" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @usuario.email = valid_address
        @usuario.should be_valid
      end      
    end
  end
  
  describe "cuando el email ya este siendo usado" do
    before do
      user_with_same_email = @usuario.dup
	  user_with_same_email.email = @usuario.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
  
  describe "cuando la contrasena este vacia" do
    before { @usuario.password = @usuario.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "cuando la contrasena del usuario no calce con la confirmacion" do
    before { @usuario.password_confirmation = "no calzan" }
    it { should_not be_valid }
  end

  describe "cuando la contrasena de confirmacion sea nula" do
    before { @usuario.password_confirmation = nil }
    it { should_not be_valid }
  end
  
  describe "con una contrasena que demasiado corta" do
    before { @usuario.password = @usuario.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "retorna valor del metodo de autentificacion" do
    before { @usuario.save }
    let(:found_user) { Usuario.find_by_email(@usuario.email) }

    describe "con una contrasena valida" do
      it { should == found_user.authenticate(@usuario.password) }
    end

    describe "con una contrasena invalida" do
      let(:user_for_invalid_password) { found_user.authenticate("invalida") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
