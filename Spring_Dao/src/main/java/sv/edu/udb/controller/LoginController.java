package sv.edu.udb.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import jakarta.servlet.http.HttpSession;
import sv.edu.udb.model.User;
import sv.edu.udb.repository.UserRepository;

import java.io.IOException;

@Controller
public class LoginController {
	private final UserRepository userRepository;

	public LoginController(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@GetMapping("/")
	public String homePage(Model model, HttpSession httpSession) {
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String loginPage(Model model, HttpSession httpSession) throws IOException {
		User user = (User) httpSession.getAttribute("user");
		if(user != null && user.getLoggedIn()) {
			if(user.getRole().equals("admin")) {
				return "redirect:/admin";
			}else if(user.getRole().equals("user")) {
				return "redirect:/user";
			}
		}
		return "login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("username") String username,
						@RequestParam("password") String password,
						Model model, HttpSession httpSession) {

		User user = userRepository.findByUsernameAndPassword(username, password);
		if (user != null) {
			user.setLoggedIn(true);
			httpSession.setAttribute("user", user);
			if (user.getRole().equals("admin")) {
				return "redirect:/admin";
			} else if (user.getRole().equals("user")) {
				return "redirect:/user";
			}
		} else {
			model.addAttribute("error", "Usuario o contraseña incorrectos");
			return "login";
		}
        return username;
    }

	@GetMapping("/register")
	public String registerPage(Model model) {
		return "register";
	}

	@PostMapping("/register")
	public String register(@RequestParam("username") String username,
						   @RequestParam("password") String password,
						   @RequestParam("email") String email,
						   @RequestParam("name") String name,
						   Model model) {

		if (userRepository.existsByUsername(username)) {
			model.addAttribute("error", "El nombre de usuario ya existe");
			return "register";
		}

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setEmail(email);
		user.setName(name);

		userRepository.save(user);
		return "registersuccess";
	}

	@GetMapping("/logout")
	public String logout(Model model, HttpSession httpSession) {
		User user = (User)httpSession.getAttribute("user");
		if(user!=null) {
			user.setLoggedIn(false);
		}
		httpSession.invalidate();
		return "redirect:/login";
	}
}

