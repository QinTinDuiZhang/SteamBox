package mybatis;

import com.niuma.model.Article;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ArticleMapper {

    //发布帖子
    boolean publish(Article article);

    //修改帖子
    boolean updateArticle(Article article);

    //删除帖子
    boolean deleteArticle(int id);

    List<Article> selectAll(@Param("id") int id, @Param("aId") int aId, @Param("pubDate")Date pubDate);
}
