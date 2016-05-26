require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

	let(:valid_attributes){
		{name: "embedded"}
		
	}

	let(:invalid_attributes){
		{name:nil}
	}

	#new
	describe "GET new" do
	  it "assigns a new category as @category" do
	    get :new, {}
	    expect(assigns(:category)).to be_a_new(Category)
	  end
	end

	#index
	describe "GET index" do
	  it "assigns all colleges as @categories" do
	  	category = Category.create!(valid_attributes)
	  	category.save
	  	get :index,{}
	  	expect(assigns(:categories)).to eq([category])
	  end
	end

	#create
	describe "POST create" do
	  	
	  	describe "with valid attributes" do
		  	it "creates a new student" do
				expect{
					post :create,{:category => valid_attributes}
				}.to change(Category, :count).by(1)
			end

			it "assigns a newly created student to @student" do
			  post :create,{:category => valid_attributes}
			  expect(assigns(:category)).to be_a(Category)
			end

			it "redirect_to index path" do
			  post :create,{:category => valid_attributes}
			  expect(response).to redirect_to(categories_path)
			end
		end

		describe "with invalid attributes" do
			it "assigns a newly created but unsaved user as @student" do
        		post :create, {:category => invalid_attributes}
        		expect(assigns(:category)).to be_a_new(Category)
      		end

			it "render to new path" do
			  	post :create,{:category => invalid_attributes}
			  	expect(response).to render_template("new")
			end
		end
	end

	
end
