package user.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		System.out.println("1. 이름  검색 ");
		System.out.println("2. 아이디 검색");
		System.out.println("번호 입력 : ");
		int select = scan.nextInt();
		
		UserDAO userDAO = UserDAO.getInstance();
		Map<String, String> map = new HashMap<String, String>();
		
		if(select == 1) {
			System.out.print("검색할 이름 입력 : ");
			String name = scan.next();
			
			map.put("col", "name");
			map.put("value", name);
			
		}else if(select == 2) {
			System.out.print("검색할 아이디 입력 : ");
			String id = scan.next();
			
			map.put("col", "id");
			map.put("value", id);
		}else {
			System.out.println("1~2까지 입력해주세요.");
			return;
		}
		
		List<UserDTO> list = userDAO.search(map);
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		}
	}

}
