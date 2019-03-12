require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  before do
    @user = create(:user)
    sign_in @user
  end

  let(:not_authorized_article) { create(:article, user_id: subject.current_user.id + 1) }
  let(:valid_attributes) { { title: 'Just Text' } }
  let(:invalid_attributes) { skip('Add a hash of attributes invalid for your model') }

  describe 'GET #index' do
    it 'assigns all articles as @articles' do
      article = create(:article, user_id: subject.current_user.id)
      create(:article, user_id: subject.current_user.id + 1)
      get :index, params: {}
      expect(assigns(:articles)).to eq([article])
    end
  end

  describe 'GET #new' do
    it 'assigns a new article as @article' do
      get :new, params: {}
      expect(assigns(:article)).to be_a_new(Article)
      expect(assigns(:article).user_id).to eq subject.current_user.id
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Article with current user\'s id' do
        expect {
          post :create, params: { article: valid_attributes }
        }.to change(Article, :count).by(1)

        expect(Article.last.user_id).to eq subject.current_user.id
      end

      it 'assigns a newly created article as @article' do
        post :create, params: { article: valid_attributes }
        expect(assigns(:article)).to be_a(Article)
        expect(assigns(:article)).to be_persisted
      end

      it 'redirects to the created article' do
        post :create, params: { article: valid_attributes }
        expect(response).to redirect_to(assigns(:article))
      end

      it 'not accepts attempt to access other user\'s article' do
        post :create, params: { article: valid_attributes.merge(user_id: not_authorized_article.user_id) }
        expect(assigns(:article).user_id).to eq subject.current_user.id
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved article as @article' do
        post :create, params: { article: invalid_attributes }
        expect(assigns(:article)).to be_a_new(Article)
      end

      it 're-renders the "new" template' do
        post :create, params: { article: invalid_attributes }
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested article as @article' do
      article = create(:article, user_id: subject.current_user.id)
      get :edit, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end

    it 'not accepts attempt to access other user\'s article' do
      get :edit, params: { id: not_authorized_article.to_param }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { title: 'New Text' } }

      it 'updates the requested article' do
        article = create(:article, user_id: subject.current_user.id)
        put :update, params: { id: article.to_param, article: new_attributes }
        article.reload
        expect(assigns(:article).title).to eq('New Text')
      end

      it 'assigns the requested article as @article' do
        article = create(:article, user_id: subject.current_user.id)
        put :update, params: { id: article.to_param, article: valid_attributes }
        expect(assigns(:article)).to eq(article)
      end

      it 'redirects to the article' do
        article = create(:article, user_id: subject.current_user.id)
        put :update, params: { id: article.to_param, article: valid_attributes }
        expect(response).to redirect_to(article)
      end

      it 'not accepts attempt to access other user\'s article' do
        put :update, params: { id: not_authorized_article.to_param, article: new_attributes }
        expect(response).to redirect_to(root_path)
        expect(assigns(:article).title).not_to eq('New Text')
      end
    end

    context 'with invalid params' do
      it 'assigns the article as @article' do
        article = create(:article, user_id: subject.current_user.id)
        put :update, params: { id: article.to_param, article: invalid_attributes }
        expect(assigns(:article)).to eq(article)
      end

      it 're-renders the "edit" template' do
        article = create(:article, user_id: subject.current_user.id)
        put :update, params: { id: article.to_param, article: invalid_attributes }
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested article' do
      article = create(:article, user_id: subject.current_user.id)
      expect {
        delete :destroy, params: { id: article.to_param }
      }.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      article = create(:article, user_id: subject.current_user.id)
      delete :destroy, params: { id: article.to_param }
      expect(response).to redirect_to(articles_url)
    end

    it 'not accepts attempt to access other user\'s article' do
      not_authorized_article

      expect {
        delete :destroy, params: { id: not_authorized_article.to_param }
      }.to change(Article, :count).by(0)
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested article as @article' do
      article = create(:article, user_id: subject.current_user.id)
      get :show, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end

    it 'not accepts attempt to access other user\'s article' do
      get :show, params: { id: not_authorized_article.to_param }
      expect(response).to redirect_to(root_path)
    end
  end
end
