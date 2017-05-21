package xiaoyuan_jiaoyi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import xiaoyuan_jiaoyi.dao.ArticleDAO;
import xiaoyuan_jiaoyi.entity.Article;
import xiaoyuan_jiaoyi.service.ArticleService;

@Service("articleService")
public class ArticleServiceimpl implements ArticleService {
	
	@Resource
	private ArticleDAO articleDAO;

	public List<Article> loadArticle(Article article, int first, int number) throws Exception {
		// TODO Auto-generated method stub
		try {
			List<Article> up = null;
			up = articleDAO.loadArticle(article.getArticleFloor(), first, number);
			return up;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public int getPage(Article article) throws Exception {
		// TODO Auto-generated method stub
		try {
			int up = 0;
			up = articleDAO.getPage(article.getArticleFloor());
			return up;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public String addArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = articleDAO.addArticle(article);
			if(i == 0) {
				return "数据库错误";
			} else {
				return "success";
			}
		} catch(Exception e) {
			throw e;
		}
	}

	public String deleteArticle(Integer articleId) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = articleDAO.deleteArticle(articleId);
			if(i == 0) {
				return "数据库错误";
			} else {
				return "success";
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public Article getArticle(int articleId) throws Exception {
		// TODO Auto-generated method stub
		try {
			Article ar = new Article();
			ar = articleDAO.getArticle(articleId);
			return ar;
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

	public String updateArticle(Article article) throws Exception {
		// TODO Auto-generated method stub
		try {
			int i = articleDAO.updateArticle(article);
			if(i == 0) {
				return "数据库错误";
			} else {
				return "success";
			}
		} catch (Exception e) {
			// TODO: handle exception
			throw e;
		}
	}

}
