

### INSTALL

1) Drag and drop `dz-restarter` into your server resources
2) You can open `config.lua` file and change the configuration to your like
3) You can open `server/commands.lua` file and change the manual restart commands and permissions
4) Ensure `dz-restarter` in your server.cfg
5) Add the 2 ace permission lines in your server.cfg file, so the script can stop the server
6) Restart your server


### ACE PERMISSION LINES | Add this two lines to your server.cfg file, This two lines will grant the dz-restarter script the ability to stop the server

add_ace resource.dz-restarter command allow # allows dz-restarter to execute commands
add_ace resource.dz-restarter command.quit allow # allows dz-restarter to execute commands

### SUPPORT

https://discord.gg/8nFqCR4xVC