vim.g.dashboard_custom_header = {
    ' ██████╗ ██████╗ ██████╗ ███████╗',
    '██╔════╝██╔═══██╗██╔══██╗██╔════╝',
    '██║     ██║   ██║██║  ██║█████╗',
    '██║     ██║   ██║██║  ██║██╔══╝',
    '╚██████╗╚██████╔╝██████╔╝███████╗',
    ' ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝'
}

vim.g.dashboard_default_executive = 'telescope'

vim.g.dashboard_custom_section = {
    a = {description = {' Find File                 '}, command = 'Telescope find_files'},
    b = {description = {' Find Word                 '}, command = 'Telescope live_grep'},
    c = {description = {' Load Last Session         '}, command = 'SessionLoad'},
    d = {description = {' Capacity ShareTools Config'}, command = ':e /mnt/c/dev/ms/CMD-SharedTools/config/cloudpc/microservices/CapacityManagement.json'},
    e = {description = {' Marks                     '}, command = 'Telescope marks'},
    f = {description = {' Recently Used Files       '}, command = 'Telescope oldfiles'},
}

-- file_browser = {description = {' File Browser'}, command = 'Telescope find_files'},

-- vim.g.dashboard_custom_shortcut = {
--     a = 'f',
--     find_word = 'SPC f a',
--     last_session = 'SPC s l',
--     new_file = 'SPC c n',
--     book_marks = 'SPC f b'
-- }
-- find_history = 'SPC f h',

vim.g.dashboard_session_directory = CONFIG_PATH .. '/session'
-- vim.g.dashboard_custom_footer = 'chrisatmachine.com'
