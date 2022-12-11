package mybatis;


import com.niuma.model.Article;
import com.niuma.model.Category;

import java.util.List;

public interface CategoryMapper {
    List<Category> getAllCategory();

    List<Article> getCategoryArticle(int categoryId);

    List<Category> ToGainByArticle(int id);

    Boolean setClassLook(int id, int hidden);

    Boolean addClass(String name);
}
