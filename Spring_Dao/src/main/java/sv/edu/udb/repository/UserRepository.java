package sv.edu.udb.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import sv.edu.udb.model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
    User findByUsernameAndPassword(String username, String password);
    boolean existsByUsername(String username);
}
