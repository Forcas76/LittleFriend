LittleFriend
Minecraft
CC:Tweaked
Lua
LittleFriend is a modular automation system for CC:Tweaked in Minecraft. It turns turtles into universal "handyman" robots that can be remotely controlled from a central computer. Assign tasks like moving to coordinates, mining, chopping trees, farming, crafting, and more via a task queue system. Perfect for automated bases, resource gathering, and large-scale farming!
🚀 Features

Task Queue System: Queue multiple tasks (e.g., move → chop → farm → return) executed sequentially.
GPS Navigation: Precise movement using Minecraft's GPS system.
Remote Control: Wireless modems for sending new tasks, overriding queues, or stopping turtles from a commander computer.
Modular Tasks: Easy to extend with new task_*.lua scripts (move, dig, chop, farm, etc.).
Auto-Update Bootloader: Downloads latest scripts from GitHub on startup.
Status Reporting: Real-time updates on turtle positions, task progress, and success/failure.
Multi-Turtle Support: Fleet of turtles managed from one computer.

📋 Requirements
Minecraft & Mods

Minecraft 1.21.1+ (Fabric/Forge/NeoForge)
CC:Tweaked (1.115.1+)

Hardware Setup
Turtles (Workers)

Mining/Advanced Turtle (with upgrades):
Wireless Modem (right side)
Crafting upgrade (for crafty tasks)
Tools: Pickaxe, Axe, Hoe, etc. (equip via scripts)


Central Computer (Commander)

Wireless Modem (any side)

🛠️ Installation

Clone/Download this repo to your local machine.
pastebin get U6GG3yMt main(or whatever what you want that name to be)
Upload Files to GitHub (this repo):
/text/turtle/
├── turtle.lua (main script)
├── task_move.lua
├── task_dig.lua
├── task_chop.lua
├── task_farm.lua
└── ... (add more tasks)

/computer/
├── computer.lua
└── commander.lua
In-Game Setup:
Place turtles/computers.
On turtle/computer: Edit startup or place boot.lua with the bootloader code (see below).

Bootloader (place in startup.lua on turtles/computers):Lua-- Paste the bootloader code from previous messages here
-- It auto-downloads files from GitHub on reboot.
Reboot: reboot – scripts download and start automatically.