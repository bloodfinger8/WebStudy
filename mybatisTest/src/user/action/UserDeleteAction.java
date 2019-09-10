package user.action;

import java.util.Scanner;

import user.dao.UserDAO;


public class UserDeleteAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.print("아이디 입력 : ");
		String id = scan.next();
		
		UserDAO userDAO = UserDAO.getInstance();
		int su = userDAO.delete(id);
		if(su == 1) {
			System.out.println("데이터를 삭제하였습니다.");
		}else {
			System.out.println("입력하신 아이디가 없습니다.");
		}
	}

}
