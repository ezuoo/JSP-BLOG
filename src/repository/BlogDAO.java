package repository;

import java.util.List;

import domain.Blog;

public interface BlogDAO {
	int create(Blog blog);
	Blog read(Blog blog);
	int cnt();
	List<Blog> readList(int index);
	int update(Blog blog);
	int delete(Blog blog);
}
