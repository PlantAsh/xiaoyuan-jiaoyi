package xiaoyuan_jiaoyi.dao;

import java.util.List;

import xiaoyuan_jiaoyi.entity.Article;

public interface ArticleDAO {

    int addArticle(Article record);

    List<Article> loadArticle(String articleFloor, int first, int number);
    
    Article getArticle(int articleId);
    
    int getPage(String articleFloor);

    int updateUserName(Article record);
    
    int updateState(int articleId);
    
    int updateArticle(Article record);
    
    int deleteArticle(Integer postsId);
    
}