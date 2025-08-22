# Minimalist Webservers
This is a collection of minimalist webservers i have built.
All they do is serve some static HTML.
Do **not** user them for anything in a production environment, as the were not designed with safety in mind.

The webservers themselves listen on all adresses (0.0.0.0), but only on port 8080.

When they are run as Docker-Containers, the Port 8080 is exposed, but re-mapped to port '6900' and onwards.
The mappings are as follows.
- [Bash: 6900](http://localhost:6900)
- [C:    6901](http://localhost:6901)
- [Rust: 6902](http://localhost:6902)
