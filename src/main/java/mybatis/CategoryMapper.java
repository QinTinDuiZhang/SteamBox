package mybatis;


import com.niuma.model.Article;
import com.niuma.model.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> getAllCategory();

    List<Article> getCategoryArticle(int id);
}
