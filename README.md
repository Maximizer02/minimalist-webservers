# Minimalist Webservers
This is a collection of minimalist webservers i have built.
All they do is serve some static HTML.
Do **not** user them for anything in a production environment, as the were not designed with safety in mind.

The Webservers listen on all adresses (0.0.0.0) but only on port 8080.

When an individual server's docker-container is started, it always exposes port 8080. It's accessible [here](http://localhost:8080).
When the containers started using the compose.yml file, the ports are exposed as follows:
- [Bash: 8080](http://localhost:8080)
- [C: 8081](http://localhost:8081)
- [Rust: 8082](http://localhost:8082)