package mybatis;

import com.niuma.model.Article;

import java.util.List;

public interface ArticleMapper {

    //发布帖子
    boolean publish(Article article);

    //修改帖子
    boolean updateArticle(Article article);

    //删除帖子
    boolean deleteArticle(int id);

    List<Article> selectAll(int id);
}
