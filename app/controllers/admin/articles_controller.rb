class Admin::ArticlesController < AdminController

  def index
    lv_locale = I18n.locale == :lv
    ru_locale = I18n.locale == :ru
    en_locale = I18n.locale == :en
    @articles = Article.where( "lv = ? OR ru = ? OR en = ?", lv_locale, ru_locale, en_locale ).order("created_at DESC")
    if params[:tag]
      @articles.tagged_with(params[:tag])
    else
      @articles
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @article = Article.find(params[:id])

  end

  # POST /notes
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to(admin_articles_url, :notice => 'Article was successfully created.') }
      else
        @articles = Article.all
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])



    respond_to do |format|
      if @article.update_attributes(article_params)

        format.html { redirect_to(admin_articles_url, :notice => 'Article was successfully updated.') }
      else
        @articles = Article.all
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(admin_articles_url) }
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :short_description, :text, :active, :main_image, :tag_list, :lv, :ru, :en)
    end

end
