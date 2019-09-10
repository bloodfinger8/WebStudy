package user.action;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectAction implements UserAction {

	@Override
	public void execute() {
		//DB
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = userDAO.getList(); //리스트타입으로 들어오기 때문에 arrayList를 안쓴다
		
		for(UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t" + userDTO.getId() + "\t" + userDTO.getPwd());
		}
		
	}

}
