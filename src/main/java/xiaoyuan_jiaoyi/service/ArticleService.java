package xiaoyuan_jiaoyi.service;

import java.util.List;

import xiaoyuan_jiaoyi.entity.Article;

public interface ArticleService {
	public List<Article> loadArticle(Article article, int first, int number) throws Exception;
	
	public int getPage(Article article) throws Exception;
	
	public String addArticle(Article article) throws Exception;
	
	public String deleteArticle(Integer articleId) throws Exception;
	
	public Article getArticle(int articleId) throws Exception;
	
	public String updateArticle(Article article) throws Exception;

}
