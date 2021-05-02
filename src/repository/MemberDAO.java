package repository;

import java.util.List;

import domain.Member;

public interface MemberDAO {
	public int create(Member member);
	public Member read(Member member);
	public List<Member> readList();
	public int login(Member member);
	public int update(Member member);
	public int delete(Member member);
}
