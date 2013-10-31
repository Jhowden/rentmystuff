require 'spec_helper'

describe ItemsController do

  let!(:item) {Item.create(title: "something cool")}

  describe "GET index" do
    it "assigns @items" do
      get :index
      expect(assigns(:items)).to include item
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET show" do
    it "shows an item" do
      get :show, id: item
      expect(response).to render_template("show")
    end
  end

end
