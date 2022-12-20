package mybatis;

import com.niuma.model.Article;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ArticleMapper {

    //发布帖子
    boolean publish(Article article);

    //修改帖子
    boolean updateArticle(Article article);

    //删除帖子
    boolean deleteArticle(int id);

    List<Article> selectAll(Map<String,Object> map);

    int newLink(@Param("articleId") int aid, @Param("categoryId") int id);

    boolean setArticleLook(int id, int hidden);

    int getArticleCounts();

    boolean setArticleThrough(int auditorId,int articleId);

    boolean setArticleBack(int articleId);

    List<Article> searchArticles(String content);

    List<Article> getUserArticle(int uId);

    int Del(int id);
}
