# Inventory

Use `production.ini` as your permanent inventory config.  
Use `development.ini` to configure your development servers and run ansible with option `-i inventory/development.ini`.  
You can override project variables using `group_vars` and `host_vars` if needed.

See: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html
