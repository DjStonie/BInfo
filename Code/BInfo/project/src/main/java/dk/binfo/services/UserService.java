package dk.binfo.services;

import dk.binfo.models.User;

public interface UserService {
	User findUserByEmail(String email);
	void saveUser(User user);
}
