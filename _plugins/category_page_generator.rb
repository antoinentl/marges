module Jekyll


  class CategoryPage < Page
    def initialize(site, base, dir, category)
      # p "initialize TagPage"
      p dir
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_page.html')
      self.data['category'] = category
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      p "generating Tag pages"
      if site.layouts.key? 'category_page'
        dir = site.config['category_dir'] || 'lubies'
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end

  end


end