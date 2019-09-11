package user.action;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateAction implements UserAction {

	@Override
	public void execute() {
		Scanner scan = new Scanner(System.in);
		
		System.out.println("찾고자 하는 아이디 입력 : ");
		String id = scan.next();
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = userDAO.select(id);
		if(userDTO != null) {
			System.out.println(userDTO.getName() +"\t"+ userDTO.getId() +"\t" + userDTO.getPwd());
			
			System.out.println("수정할 이름 : ");
			String name = scan.next();
			System.out.println("수정할 비밀번호 : ");
			String pwd = scan.next();
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("name", name);
			map.put("id" , id);
			map.put("pwd", pwd);
			
//			userDTO.setName(name);
//			userDTO.setId(id);
//			userDTO.setPwd(pwd);
			
			userDAO.update(map);
			System.out.println("데이터를 수정하였습니다.");
			
		}else {
			System.out.println("찾고자 하는 아이디가 없습니다.");
		}
//		찿고자 하는 아이디 입력 : angel
//		찾고자 하는 아이디가 없습니다 .
//		
//		찾고자하는 아이디 입력 :hong
//		홍길동  hong 111
//		
//		수정할 이름 : 홍당무
//		수정할 비밀번호 입력 : 333
//		데이터를 수정하였습니다.
	}

}
